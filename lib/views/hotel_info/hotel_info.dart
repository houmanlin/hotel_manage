import 'package:flutter/material.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/store_room_type/store_room_type.dart';
import 'package:hotel_manage/util/system_params.dart';
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
  bool _initFlag = true;
  StoreRoomType _storeData = StoreRoomType(
    id: "",
    name: "",
    code: "",
    basePrice: "",
    imageUrls: "",
    remark: '',
    bedType: '',
    area: '',
  );
  List<StoreRoomType> _roomTypeList = [];
  String _room_id = "";

  List<String> _bannerList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initFlag) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null) {
        _room_id = args['room_id'];
        _getStoreData();
        _getRoomTypeList();
      }
    }
    _initFlag = false;
  }

  Future<void> _getStoreData() async {
    // TODO: implement initState
    ResponseComm ResponseData = await StoreRoomTypeApi.getStoreRoomTypeInfo(
      _room_id,
    );

    if (ResponseData.Code == 0) {
      StoreRoomType res = StoreRoomType.fromJson(ResponseData.Data);

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
            hotelName: _storeData.name,
            tags: [
              _storeData.bedType,
              "可住宿${_storeData.maxGuestCount}人",
              _storeData.name,
              "${_storeData.area}m²",
            ],
            basePrice: _storeData.basePrice.toString(),
            isFavorite: false,
            onFavoriteTap: () {},
            onMapTap: () {},
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(containerRadian),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "设备设施",
                    style: TextStyle(
                      fontSize: textTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
