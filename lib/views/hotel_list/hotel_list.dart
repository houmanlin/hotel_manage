import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/util/system_params.dart';

import 'package:hotel_manage/api/model/store/store.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/routers/routers.dart';
import 'component/hotel_filter/hotel_filter.dart';

class HotelListPage extends StatefulWidget {
  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Store> _storeData = [];
  String _checkInDate = '05月20日 周二';
  String _checkOutDate = '05月21日 周三';

  @override
  void initState() {
    super.initState();
    _getStoreData();
  }

  Future<void> _getStoreData() async {
    // TODO: implement initState
    ResponseComm ResponseData = await StoreApi.getStoreList(
      StoreParams(
        name: null,
        code: null,
        phone: '',
        address: '',
        startBusinessTime: '',
        endBusinessTime: '',
        status: null,
        remark: '',
        imageUrls: '',
        createTime: '',
        pageNo: 1,
        pageSize: 100,
      ),
    );

    if (ResponseData.Code == 0) {
      PageResponseComm<Store> responseData = PageResponseComm.fromJson(
        ResponseData.Data,
        Store.fromJson,
      );

      setState(() {
        _storeData = responseData.Data;
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
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(containerSmallRadian),
                child: Image.network(
                  "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            HotelFilter(
              checkInDate: _checkInDate,
              checkOutDate: _checkOutDate,
              onSearch: () {
                _handleSearch();
              },
            ),
            SizedBox(height: 20),
            _buildHotelList(),
          ],
        ),
      ),
    );
  }

  void _handleSearch() {
    print('搜索条件:');
    print('入住日期: $_checkInDate');
    print('离店日期: $_checkOutDate');
  }

  Widget _buildHotelList() {
    return Column(
      children: List.generate(_storeData.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.hotelRoomList, arguments: {
              "store_id": _storeData[index].id
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
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(containerSmallRadian),
                  ),
                  child: Image.network(
                    _storeData[index].imageUrls,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
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
                        _storeData[index].address,
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
              ],
            ),
          ),
        );
      }),
    );
  }
}
