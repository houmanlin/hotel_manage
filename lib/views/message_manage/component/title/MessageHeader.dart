import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class MessageHeaderCheck {
  final String Icon;
  final String Title;
  final int MessageNum;

  MessageHeaderCheck({
    required this.Icon,
    required this.Title,
    required this.MessageNum,
  });
}

class MessageHeader extends StatefulWidget {
  int controllerIndex;
  final void Function(int selectIndex) onCheckPage;
  MessageHeader({
    super.key,
    this.controllerIndex = 0,
    required this.onCheckPage,
  });

  @override
  State<MessageHeader> createState() => _MessageHeaderState();
}

class _MessageHeaderState extends State<MessageHeader> {
  List<MessageHeaderCheck> messageCheckList = [
    MessageHeaderCheck(Title: "所有消息", MessageNum: 0, Icon: ""),
    MessageHeaderCheck(Title: "奖励", MessageNum: 0, Icon: ""),
    MessageHeaderCheck(Title: "社交", MessageNum: 0, Icon: ""),
    MessageHeaderCheck(Title: "公告", MessageNum: 0, Icon: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "消息中心",
            style: TextStyle(fontSize: textTitleSize, color: primaryColor),
          ),
          Text(
            "随时掌握社区动态与奖励信息",
            style: TextStyle(fontSize: textSize, color: colorDescription),
          ),

          Row(
            spacing: 30,
            children: List.generate(
              messageCheckList.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onCheckPage(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(bottom: 5, top: 10),
                    decoration: BoxDecoration(
                      border: BoxBorder.fromLTRB(
                        bottom: BorderSide(
                          width: 2,
                          color: widget.controllerIndex == index
                              ? primaryColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageCheckList[index].Title,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              containerCircle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
