import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/util/system_params.dart';

class HotelListPage extends StatefulWidget {
  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Container(
        color: colorWhite,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(containerSmallRadian),
              child:  Image.network(
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
