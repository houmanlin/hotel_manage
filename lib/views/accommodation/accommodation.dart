import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_bar.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/util/system_params.dart';

import 'accommodation_manage/accommodation_manage.dart';
import 'accommodation_order/accommodation_order.dart';
import 'component/accommodation_check/accommodation_check.dart';

class AccommodationPage extends StatefulWidget {
  const AccommodationPage({super.key});

  @override
  State<AccommodationPage> createState() => _AccommodationPageState();
}

class _AccommodationPageState extends State<AccommodationPage> {

  int _currentIndex = 1;


  void _accommodationCheck(int current){
    setState(() {
      _currentIndex = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Stack(
          children: [
            Positioned(
              child: SizedBox(height: 65, child: AccommodationCheck(onAccommodationCheck: _accommodationCheck,currentIndex: _currentIndex)),
            ),
            _currentIndex == 1 ?
            AccommodationManage() :
            AccommodationOrder(),
          ],
        ),
      ),
    );
  }
}
