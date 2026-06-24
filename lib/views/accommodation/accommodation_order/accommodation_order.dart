import 'package:flutter/cupertino.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/order/order.dart';

import 'component/order_item/order_item.dart';
import 'component/lock_control_rule/lock_control_rule.dart';
import 'component/reward_card/reward_card.dart';

class AccommodationOrder extends StatefulWidget{
  const AccommodationOrder({super.key});

  @override
  State<StatefulWidget> createState() => _AccommodationOrderState();

}
class _AccommodationOrderState extends State<AccommodationOrder>{
  List<OrderData> _orderList = [];
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
          ...List.generate(_orderList.length, (index) => OrderItem(
            hotelName: _orderList[index].store!.name,
            roomType: _orderList[index].orderRoomDO == null ? "" : _orderList[index].orderRoomDO!.roomTypeId.toString(),
            totalPrice: _orderList[index].totalAmount,
            address: "",
            checkInDate: _orderList[index].checkInDate,
            checkOutDate: _orderList[index].checkOutDate,
            countNightNum: _orderList[index].nightCount,
            landlordName: _orderList[index].store!.address,
            onContactLandlord: (){
              print("123");
              print(_orderList[index].checkInDate);
            },
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
      PageResponseComm<OrderData> resolveData = PageResponseComm.fromJson(data.Data, OrderData.fromJson);
      setState(() {
        _orderList = resolveData.Data;
      });
    }
  }

}