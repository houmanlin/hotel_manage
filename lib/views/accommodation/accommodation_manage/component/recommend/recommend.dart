import 'package:flutter/material.dart';
import 'package:hotel_manage/api/model/hotel/hotel.dart';
import 'package:hotel_manage/components/hotel_card.dart';
import 'package:hotel_manage/util/system_params.dart';

class RecommendList extends StatelessWidget {
  final List<HotelModel> _hotelList = [
    HotelModel(
      ImageUrl: "https://...",
      Title: "苍山脚下·禅意民宿",
      Description: "独立小院，带厨房，步行5分钟到苍山索道",
      Price: 380,
      Rating: 4.9,
      ReviewCount: 234,
      TagText: "可赚提成",
      ExtraInfo: "发布体验笔记可赚¥15提成",
    ),
    HotelModel(
      ImageUrl: "https://...",
      Title: "苍山脚下·禅意民宿",
      Description: "独立小院，带厨房，步行5分钟到苍山索道",
      Price: 380,
      Rating: 4.9,
      ReviewCount: 234,
      TagText: "可赚提成",
      ExtraInfo: "发布体验笔记可赚¥15提成",
    ),
  ];

  RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "为你推荐",
                  style: TextStyle(
                    fontSize: textTitleSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "根据你的偏好",
                  style: TextStyle(fontSize: textSize, color: colorBlack),
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(
              _hotelList.length,
              (index) => HotelCard(
                imageUrl: _hotelList[index].ImageUrl,
                title: _hotelList[index].Title,
                description: _hotelList[index].Description,
                price: _hotelList[index].Price,
                rating: _hotelList[index].Rating,
                reviewCount: _hotelList[index].ReviewCount,
                tagText: _hotelList[index].TagText,
                tagColor: Colors.orange,
                extraInfo: _hotelList[index].ExtraInfo,
                onTap: () => Navigator.pushNamed(context, "/hotelInfo"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
