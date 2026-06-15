import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';
class CheckInInfoComponent extends StatefulWidget{

  final String guestName;
  final String phoneNumber;
  final String arrivalTime;
  final VoidCallback? onRoomCountDecrease;
  final VoidCallback? onRoomCountIncrease;
  final VoidCallback? onGuestNameEdit;
  final VoidCallback? onPhoneEdit;
  final VoidCallback? onArrivalTimeEdit;

  const CheckInInfoComponent({
    super.key,
    required this.guestName,
    required this.phoneNumber,
    required this.arrivalTime,
    this.onRoomCountDecrease,
    this.onRoomCountIncrease,
    this.onGuestNameEdit,
    this.onPhoneEdit,
    this.onArrivalTimeEdit,
  });

  @override
  State<CheckInInfoComponent> createState() => _CheckInInfoState();

}

class _CheckInInfoState extends State<CheckInInfoComponent> {

  final TextEditingController _phoneController = TextEditingController();
  final List<TextEditingController> _customerControl = [TextEditingController()];
  int _roomCount = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Column(
        children: [
          _buildHeader(),
          ...List.generate(_customerControl.length, (index)=>
            _buildInfoRow(
              controller: _customerControl[index],
              label: '住客姓名',
              value: widget.guestName,
              hintText: "每间填1位住客姓名",
              icon: Icons.verified_user_outlined,
              onTap: widget.onGuestNameEdit,
            )
          ),
          _buildInfoRow(
            controller: _phoneController,
            label: '联系手机',
            value: '+86 $widget.phoneNumber',
            hintText: "用于接收通知短信",
            icon: Icons.phone_outlined,
            onTap: widget.onPhoneEdit,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '入住信息',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Icon(Icons.help_outline, color: Colors.grey, size: 18),
        Spacer(),
        _buildRoomCountControl(),
      ],
    );
  }

  Widget _buildRoomCountControl() {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            if (_roomCount > 1 ){
              setState(() {
                _roomCount--;
              });
            }

          },
          icon: Icon(
            Icons.remove_circle_outline,
            color: _roomCount > 1 ? Colors.grey : Colors.grey[300],
            size: 24,
          ),
          constraints: BoxConstraints(minWidth: 32, minHeight: 32),
        ),
        SizedBox(width: 8),
        Text(
          '$_roomCount间',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        IconButton(
          onPressed: (){
            _customerControl.add(TextEditingController());
            setState(() {
              _roomCount++;
            });
          },
          icon: Icon(Icons.add_circle_outline, color: Colors.blue, size: 24),
          constraints: BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required TextEditingController controller,
    required String label,
    required String value,
    required String hintText,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        SizedBox(width: 5),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: textSize, color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(containerSmallRadian),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
            style: TextStyle(fontSize: textSize),
          ),
        ),
      ],
    );
  }

}
