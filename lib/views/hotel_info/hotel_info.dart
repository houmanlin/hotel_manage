import 'package:flutter/material.dart';
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


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      storeId = args['store_id'];
      _getStoreData();
    }
  }

  Future<void> _getStoreData() async {
    // TODO: implement initState
    ResponseComm ResponseData = await StoreRoomTypeApi.getStoreRoomTypeList(
      StoreRoomTypeParams(
        status: 1,
        storeId: storeId,
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
        _storeData = res;
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
            images: [
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80",
            ],
            imageLabels: ['封面', '外观', '房间', '餐厅', '休闲', '公'],
            title: '温度源酒店',
          ),
          HotelInfoHeader(
            hotelName: '绍兴温度源酒店(奥体中心市政府店)',
            rankText: '绍兴市豪华酒店好评榜第1名',
            consumerCount: '消费人数1千+',
            tags: ['豪华型', '2025开业', '健身房', '儿童乐园', '接站服务', '会议厅', '茶室', '设施'],
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
