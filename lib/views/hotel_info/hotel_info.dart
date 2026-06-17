import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/store_room_type/store_room_type.dart';
import 'package:hotel_manage/routers/routers.dart';
import 'package:hotel_manage/util/media_query_utils.dart';
import 'package:hotel_manage/util/select_time_range.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/util/utils.dart';

import 'component/image_carousel.dart';
import 'component/hotel_info_header.dart';

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
    facilityDOS: [],
  );
  List<StoreRoomType> _roomTypeList = [];
  String _roomid = "";

  List<String> _bannerList = [];

  String _checkInDate = "";
  String _checkOutDate = "";
  int _nightNum = 1;

  @override
  void initState() {
    super.initState();
    _checkInDate = DateFormat(
      "MM月dd日",
    ).format(selectTimeRangeSingle.getSelectStartTime());
    _checkOutDate = DateFormat(
      "MM月dd日",
    ).format(selectTimeRangeSingle.getSelectEndTime());
    _nightNum = selectTimeRangeSingle.getCountNight();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initFlag) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null) {
        _roomid = args['room_id'];
        _getStoreData();
        _getRoomTypeList();
      }
    }
    _initFlag = false;
  }

  Future<void> _getStoreData() async {
    // TODO: implement initState
    ResponseComm responseData = await StoreRoomTypeApi.getStoreRoomTypeInfo(
      _roomid,
    );

    if (responseData.Code == 0) {
      StoreRoomType res = StoreRoomType.fromJson(responseData.Data);

      setState(() {
        _storeData = res;
        _bannerList = res.imageUrls.split(",");
      });
    } else {
      BotToast.showText(text: responseData.Msg);
    }
  }

  Future<void> _getRoomTypeList() async {
    ResponseComm responseData = await StoreRoomTypeApi.getStoreRoomTypeList(
      StoreRoomTypeParams(
        status: 1,
        storeId: _storeData.storeId,
        pageNo: 1,
        pageSize: 100,
        id: '',
        name: '',
        code: '',
      ),
    );

    if (responseData.Code == 0) {
      PageResponseComm<StoreRoomType> resolveData = PageResponseComm.fromJson(
        responseData.Data,
        StoreRoomType.fromJson,
      );

      List<StoreRoomType> res = resolveData.Data.map((item) {
        item.imageUrls = getFirstImageUrl(item.imageUrls) == null
            ? ""
            : getFirstImageUrl(item.imageUrls) as String;
        return item;
      }).toList();

      setState(() {
        _roomTypeList = res;
      });
    } else {
      BotToast.showText(text: responseData.Msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
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
                  "可住${_storeData.maxGuestCount}人",
                  _storeData.name,
                  "${_storeData.area}m²",
                ],
                basePrice: _storeData.basePrice.toString(),
                isFavorite: false,
                onFavoriteTap: () {},
                onMapTap: () {},
              ),
              if (_storeData.facilityDOS.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(containerRadian),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    color: Colors.white,
                    child: Container(
                      constraints: BoxConstraints(minHeight: 100),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "设备设施",
                              style: TextStyle(
                                fontSize: textTitleSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              _storeData.facilityDOS.length,
                              (index) => SizedBox(
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    _storeData.facilityDOS[index].name,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ClipRRect(
                borderRadius: BorderRadius.circular(containerRadian),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: Container(
                    constraints: BoxConstraints(minHeight: 100),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "预定须知",
                            style: TextStyle(
                              fontSize: textTitleSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "入住时间:"),
                              TextSpan(text: "14:00后"),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "退房时间:"),
                              TextSpan(text: "12:00后"),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "取消政策:"),
                              TextSpan(text: "入住前1天18:00前可免费取消"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(containerRadian),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 15,
                    bottom: 90,
                  ),
                  color: Colors.white,
                  child: _buildHotelList(context),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtil.screenWidth,
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "$_checkInDate-$_checkOutDate"),
                            ],
                          ),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text.rich(
                          TextSpan(children: [TextSpan(text: "$_nightNum晚")]),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context.pushNamed(AppRoutes.bookInfo,queryParameters: {
                          "room_id": _storeData.id
                        });
                      },
                      child: Text("立即订房"),
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

  Widget _buildHotelList(BuildContext context) {
    return Column(
      children: List.generate(_roomTypeList.length, (index) {
        return GestureDetector(
          onTap: () {
            _roomid = _roomTypeList[index].id;
            _getStoreData();
            _getRoomTypeList();
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(containerRadian),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(containerSmallRadian),
                  ),
                  child: _roomTypeList[index].imageUrls == ""
                      ? Center(child: Icon(Icons.now_wallpaper))
                      : Image.network(
                          _roomTypeList[index].imageUrls,
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _roomTypeList[index].name,
                        style: TextStyle(
                          fontSize: textTitleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _roomTypeList[index].remark,
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            _roomTypeList[index].basePrice.toString(),
                            style: TextStyle(
                              fontSize: textTitleSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[500],
                            ),
                          ),
                          Text(
                            '起',
                            style: TextStyle(
                              fontSize: textSmallSize,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.bookInfo,queryParameters: {
                        "room_id": _roomTypeList[index].id
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(containerCircle),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "订",
                      style: TextStyle(
                        fontSize: textTitleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
