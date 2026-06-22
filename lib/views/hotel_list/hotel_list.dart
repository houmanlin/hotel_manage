import 'dart:io';

import 'package:auto_shimmer_animate/auto_shimmer_animate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/util/select_time_range.dart';
import 'package:hotel_manage/util/system_params.dart';

import 'package:hotel_manage/api/model/store/store.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/routers/routers.dart';
import 'package:hotel_manage/util/utils.dart';
import 'component/hotel_filter/hotel_filter.dart';

class HotelListPage extends StatefulWidget {
  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Store> _storeData = [
    Store(id: "", name: "", code: "", address: "", imageUrls: ""),
  ];
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getStoreData();
    _checkInDate = selectTimeRangeSingle.getSelectStartTime();
    _checkOutDate = selectTimeRangeSingle.getSelectEndTime();
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

      List<Store> res = responseData.Data.map((item) {
        item.imageUrls = getFirstImageUrl(item.imageUrls) == null
            ? ""
            : getFirstImageUrl(item.imageUrls) as String;
        return item;
      }).toList();
      setState(() {
        _storeData = res;
        _isLoading = false;
      });
    } else {
      print(ResponseData.Msg);
    }
  }

  void _selectDateChanged(DateTime startTime, DateTime endTime) {
    setState(() {
      _checkInDate = selectTimeRangeSingle.getSelectStartTime();
      _checkOutDate = selectTimeRangeSingle.getSelectEndTime();
    });
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
              onDateChanged: _selectDateChanged,
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
    print(_isLoading);
    return AutoShimmerAnimate(
      isLoading: _isLoading,
      child: Column(
        children: List.generate(_storeData.length, (index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                AppRoutes.hotelRoomList,
                queryParameters: {"store_id": _storeData[index].id},
              );
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
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image_not_supported);
                      },
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) return child;
                            return Icon(Icons.image_not_supported);
                          },
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
      ),
    );
  }
}
