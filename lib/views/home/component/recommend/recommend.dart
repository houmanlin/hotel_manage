import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class LockControl extends StatelessWidget {
  const LockControl({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(containerRadian),
      child: Stack(
        children: [
          _buildBackgroundImage(),
          _buildContent(),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&q=80',
      width: double.infinity,
      height: 220,
      fit: BoxFit.cover,
    );
  }

  Widget _buildContent() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black12, Colors.black54],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTags(),
              _buildTitle(),
              SizedBox(height: 8),
              _buildDescription(),
              _buildDescriptionTag(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTags() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Color(0xFF006D5B),
            borderRadius: BorderRadius.circular(containerSmallRadian),
          ),
          child: Text(
            '精品路线',
            style: TextStyle(fontSize: textSmallSize, color: colorWhite),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8, left: 8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(containerSmallRadian),
          ),
          child: Text(
            '为您推荐',
            style: TextStyle(fontSize: textSmallSize, color: colorWhite),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      '大理古城晨间漫步',
      style: TextStyle(
        fontSize: textTitleSize,
        color: colorWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescriptionTag() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(containerSmallRadian),
          ),
          child: Row(
            children: [
              Icon(Icons.timer, size: 12, color: colorWhite),
              SizedBox(width: 4),
              Text(
                '2小时',
                style: TextStyle(
                  fontSize: textSmallSize,
                  color: colorWhite,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12, left: 8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(containerSmallRadian),
          ),
          child: Text(
            '节奏轻松',
            style: TextStyle(fontSize: textSmallSize, color: colorWhite),
          ),
        ),
      ],
    );
  }


  Widget _buildDescription() {
    return Text(
      '需要穿过历史古城的向导文化之旅，包含在传统的白族民居享用早餐。',
      style: TextStyle(fontSize: textSize, color: Colors.white70),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildBottomRow() {
    return Positioned(
      bottom: 20,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Color(0xFF006D5B),
              borderRadius: BorderRadius.circular(containerCircle),
            ),
            child: Icon(Icons.arrow_forward, size: 18, color: colorWhite),
          ),
        ],
      ),
    );
  }
}
