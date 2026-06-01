import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  int _currentTab = 0;
  final List<String> _tabs = ['在住', '待住', '历史'];

  void changeOrderList(int currentTab) {
    setState(() {
      _currentTab = currentTab;
    });
  }

  List<Widget> _renderOrderList(){
    if (_currentTab == 0){
      return [_buildOrderItem()];
    }
    if (_currentTab == 1){
      return [_buildWaitOrderItem()];
    }
    if (_currentTab == 2){
      return [_buildOrderHistoryItem()];
    }

    return [_buildNormalOrder()];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerBigRadian),
      ),
      child: Column(children: [_buildTabBar(), _buildOrderCard()]),
    );
  }

  // 选项卡
  Widget _buildTabBar() {
    return Row(
      children: _tabs.asMap().entries.map((entry) {
        int index = entry.key;
        String tab = entry.value;
        return Expanded(
          child: Container(
            height: 50,
            decoration: index == _currentTab
                ? BoxDecoration(
                    border: BoxBorder.fromLTRB(
                      bottom: BorderSide(color: primaryColor, width: 2),
                    ),
                  )
                : null,
            child: TextButton(
              onPressed: () {
                changeOrderList(index);
              },
              child: Text(
                tab,
                style: TextStyle(
                  color: index == _currentTab ? primaryColor : Colors.grey,
                  fontSize: 16,
                  fontWeight: index == _currentTab
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // 订单列表
  Widget _buildOrderCard() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: _renderOrderList()),
    );
  }

  // 入住订单信息
  Widget _buildOrderItem() {
    return Column(
      children: [
        Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(containerRadian),
              child: Image.network(
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '云景阁·海景房',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '大理古城洱海边',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '5月8日 - 5月15日 · 7晚',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.black54, size: 14),
                      SizedBox(width: 6),
                      Text(
                        '联系房东',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '报修',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '续住',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 入住历史
  Widget _buildOrderHistoryItem() {
    return Column(
      children: [
        Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(containerRadian),
              child: Image.network(
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '云景阁·海景房',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '大理古城洱海边',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '5月8日 - 5月15日 · 7晚',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(1, 198, 83, 0.2),
                      borderRadius: BorderRadius.circular(2)
                    ),
                    child: Text("已完成", style: TextStyle(fontSize: textSmallSize, color: Colors.green),),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '查看详情',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '再次预订',
                    style: TextStyle(fontSize: 14, color: colorWhite),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  // 待入住
  Widget _buildWaitOrderItem() {
    return Column(
      children: [
        Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(containerRadian),
              child: Image.network(
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '云景阁·海景房',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '大理古城洱海边',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey, size: 12),
                      SizedBox(width: 4),
                      Text(
                        '5月8日 - 5月15日 · 7晚',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.black54, size: 14),
                      SizedBox(width: 6),
                      Text(
                        '联系房东',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(containerRadian),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '查看详情',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 没有订单
  Widget _buildNormalOrder() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month, size: 60, color: colorBlack),
          Text("没有入住信息", style: TextStyle(color: colorBlack)),
        ],
      ),
    );
  }
}
