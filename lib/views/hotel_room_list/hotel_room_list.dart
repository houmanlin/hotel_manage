import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/api/model/store_room_type/store_room_type.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/routers/routers.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';

import '../../util/utils.dart';

class HotelRoomListPage extends StatefulWidget {
  const HotelRoomListPage({super.key});

  @override
  State<HotelRoomListPage> createState() => _HotelRoomListPageState();
}

class _HotelRoomListPageState extends State<HotelRoomListPage> {
  late String storeId;

  List<StoreRoomType> _storeData = [];

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
      appBar: CustomHomeAppBar(),
      body: Container(
        color: scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: 10),
        child: ListView(children: [_buildHotelList()]),
      ),
    );
  }

  Widget _buildHotelList() {
    return Column(
      children: List.generate(_storeData.length, (index) {
        return GestureDetector(
          onTap: (){
            context.pushNamed(AppRoutes.hotelInfo, queryParameters: {
              "room_id": _storeData[index].id
            });
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
                  child: _storeData[index].imageUrls == ""
                      ? Center(child: Icon(Icons.now_wallpaper))
                      : Image.network(
                          _storeData[index].imageUrls,
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _storeData[index].name,
                        style: TextStyle(
                          fontSize: textTitleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _storeData[index].remark,
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            _storeData[index].basePrice.toString(),
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
                      context.push(AppRoutes.bookInfo);
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
