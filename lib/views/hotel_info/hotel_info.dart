import 'package:flutter/material.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/store/store.dart';
import 'package:hotel_manage/api/model/store_room_type/store_room_type.dart';
import 'package:hotel_manage/util/utils.dart';
import 'package:hotel_manage/views/accommodation/accommodation_order/component/recommend/recommend.dart';

import 'component/image_carousel.dart';
import 'component/hotel_info_header.dart';
import 'component/room_list.dart';
import 'component/review_list.dart';

class HotelInfoPage extends StatefulWidget {
  const HotelInfoPage({super.key});

  @override
  State<HotelInfoPage> createState() => _HotelInfoPageState();

}
class _HotelInfoPageState extends State<HotelInfoPage> {
  Store _storeData = Store(id: "", name: "", code: "", basePrice: "", address: "", imageUrls: "");
  List<StoreRoomType> _roomTypeList = [];
  String _room_id = "";


  List<String> _bannerList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _room_id = args['room_id'];
      _getStoreData();
      _getRoomTypeList();
    }
  }

  Future<void> _getStoreData() async {
// TODO: implement initState
    ResponseComm ResponseData = await StoreApi.getStoreInfo(_room_id);

    if (ResponseData.Code == 0) {
      Store res = Store.fromJson(ResponseData.Data);

      setState(() {
        _storeData = res;
        _bannerList = res.imageUrls.split(",");
      });
    } else {
      print(ResponseData.Msg);
    }
  }
  Future<void> _getRoomTypeList() async {
    ResponseComm ResponseData = await StoreRoomTypeApi.getStoreRoomTypeList(
      StoreRoomTypeParams(
        status: 1,
        storeId: _room_id,
        pageNo: 1,
        pageSize: 100,
        id: '',
        name: '',
        code: '',
      ),
    );

    if (ResponseData.Code == 0) {
      PageResponseComm<StoreRoomType> responseData = PageResponseComm.fromJson(
        ResponseData.Data,
        StoreRoomType.fromJson,
      );

      List<StoreRoomType> res = responseData.Data.map((item) {
        item.imageUrls = getFirstImageUrl(item.imageUrls) == null
            ? ""
            : getFirstImageUrl(item.imageUrls) as String;
        return item;
      }).toList();

      setState(() {
        _roomTypeList = res;
      });
    } else {
      print(ResponseData.Msg);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ImageCarousel(
            images: _bannerList,
            imageLabels: ['封面', '外观', '房间', '餐厅', '休闲', '公'],
            title: _storeData.name,
          ),
          HotelInfoHeader(
            hotelName:  _storeData.name,
            rankText: null,
            consumerCount: null,
            tags: [],
            rating: 4.8,
            reviewCount: 326,
            address: '越城区解放大道158号天信大厦2幢',
            nearbyInfo: '距你直线70米 · 近凤林地铁站',
            isFavorite: false,
            onFavoriteTap: () {},
            onMapTap: () {},
          ),
          RoomList(),
          ReviewList(),
          RecommendList(),
        ],
      ),
    );
  }
}
