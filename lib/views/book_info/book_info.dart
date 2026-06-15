import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/views/book_info/component/check_in_info_component.dart';
import './component/book_info_component.dart';

class BookInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            BookInfoComponent(
              checkInDate: '6月12日',
              checkOutDate: '6月13日',
              roomType: '商务大床房',
              roomDetails: '大床 · 无早餐 · 禁烟',
              cancelPolicy: '享无忧取消,入住日20:00前可免费取消',
              onRoomDetailTap: () {

              },
              onBookingReadTap: () {

              },
            ),
            CheckInInfoComponent(
              guestName: "",
              phoneNumber: "0",
              arrivalTime: "0",
              onRoomCountDecrease: (){

              },
              onRoomCountIncrease: (){

              },
              onGuestNameEdit: (){

              },
              onPhoneEdit: (){

              },
              onArrivalTimeEdit: (){

              },
            ),
          ],
        ),
      ),

    );
  }
}