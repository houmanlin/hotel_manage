import 'package:flutter/cupertino.dart';

import 'component/lock_control/lock_control.dart';
import 'component/lock_control_rule/lock_control_rule.dart';
import 'component/reward_card/reward_card.dart';

class AccommodationManage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 65),
      child: ListView(
        children: [
          RewardCard(),
          LockControl(),
          LockControl(),
          LockControl(),
          LockControlRule(),
        ]
        ,
      ),
    );
  }

}