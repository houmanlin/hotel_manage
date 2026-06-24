import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/order/order.dart';

import 'component/lock_control/lock_control.dart';
import 'component/lock_control_rule/lock_control_rule.dart';
import 'component/reward_card/reward_card.dart';

class AccommodationManage extends StatefulWidget{
  @override
  State<AccommodationManage> createState() => _AccommodationManageState();

}
class _AccommodationManageState extends State<AccommodationManage>{
  List<OrderData> _orderList = [];
  String _orderText = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 65),
      child: ListView(
        children: [
          RewardCard(),
          ...List.generate(_orderList.length, (index) => LockControl(
            hotelName: _orderList[index].store!.name,
            roomNo: _orderList[index].orderRoomDO == null ? "" : _orderList[index].orderRoomDO!.roomNo.toString(),
            address: _orderList[index].store!.address,
            checkInDate: _orderList[index].checkInDate,
            checkOutDate: _orderList[index].checkOutDate,
          )),
          LockControlRule(),
        ]
        ,
      ),
    );
  }

  void _getData() async{
    ResponseComm data = await OrderApi.getOrderList(OrderRequest(pageNo: 1, pageSize: 100, sortingFields: []));
    if(data.Code == 0){

      print(data.Data.toString());
      // PageResponseComm<OrderData> resolveData = PageResponseComm.fromJson(data.Data, OrderData.fromJson);

      setState(() {
        // _orderList = resolveData.Data;
        _orderText = data.Data.toString();
      });
    }
  }

}