import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class SearchCreator extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: colorWhite,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: colorGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.search_outlined, color: Colors.grey[400]),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: '搜索',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              spacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorGrey,
                    borderRadius: BorderRadius.circular(containerCircle),
                  ),
                  child: Text("测试测试测试测试测试"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorGrey,
                    borderRadius: BorderRadius.circular(containerCircle),
                  ),
                  child: Text("测试测试测试测试测试"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
