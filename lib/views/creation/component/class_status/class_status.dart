import 'package:flutter/cupertino.dart';
import 'package:hotel_manage/util/media_query_utils.dart';
import 'package:hotel_manage/util/system_params.dart';

class ClassStatusPage extends StatefulWidget {
  const ClassStatusPage({super.key, this.onChange});

  final void Function(int)? onChange;

  @override
  State<ClassStatusPage> createState() => _ClassStatusPageState();
}

class _ClassStatusPageState extends State<ClassStatusPage> {
  List<String> menuList = ["关注", "发现", "绍兴"];
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          menuList.length,
          (index) => _widgetBuild(menuList[index], index),
        ),
      ),
    );
  }

  Widget _widgetBuild(String text, int index) {
    bool isSelect = this._selectIndex == index;
    return GestureDetector(
      onTap: () {
        if (widget.onChange != null) {
          widget.onChange!(_selectIndex);
        }
        setState(() {
          _selectIndex = index;
        });
      },
      child: Container(
        alignment: AlignmentGeometry.center,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(
              color: isSelect ? primaryColor : colorWhite,
              width: 3,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textBigSize,
            color: isSelect ? primaryColor : colorBlack,
          ),
        ),
      ),
    );
  }
}
