import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorGrey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset("lib/assets/images/search_creator.png", width: 18, height: 18, color: Colors.grey[400]),
          ),
          Expanded(
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: '搜索',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
