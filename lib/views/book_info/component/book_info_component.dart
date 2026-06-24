import 'package:flutter/material.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';
import 'package:hotel_manage/api/model/store_room_type/store_room_type.dart';
import 'package:hotel_manage/util/select_time_range.dart';
import 'package:hotel_manage/util/utils.dart';
import 'package:intl/intl.dart';
import 'package:hotel_manage/util/system_params.dart';

class BookInfoComponent extends StatefulWidget {
  final String checkInDate;
  final String checkOutDate;
  final String roomType;
  final String roomDetails;
  final String cancelPolicy;
  final VoidCallback? onRoomDetailTap;
  final VoidCallback? onBookingReadTap;

  const BookInfoComponent({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomType,
    required this.roomDetails,
    required this.cancelPolicy,
    this.onRoomDetailTap,
    this.onBookingReadTap,
  });

  @override
  State<StatefulWidget> createState() => _BookInfoComponentState();
}

class _BookInfoComponentState extends State<BookInfoComponent> {
  bool _initFlag = true;
  String _roomId = "";
  String _checkInDate = "";
  String _checkOutDate = "";
  int _nightNum = 1;
  List<String> _imageUrls = [];

  StoreRoomType _storeRoomType = StoreRoomType(
    id: "",
    name: "",
    code: "",
    area: "",
    bedType: "",
    imageUrls: "",
    remark: "",
    facilityDOS: [],
  );

  @override
  void initState() {
    super.initState();
    _checkInDate = DateFormat(
      "MM月dd日",
    ).format(selectTimeRangeSingle.getSelectStartTime());
    _checkOutDate = DateFormat(
      "MM月dd日",
    ).format(selectTimeRangeSingle.getSelectEndTime());
    _nightNum = selectTimeRangeSingle.getCountNight();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initFlag) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null) {
        _roomId = args['room_id'];
        _getRoomTypeInfo();
      }
    }
    _initFlag = false;
  }

  Future<void> _getRoomTypeInfo() async {
    ResponseComm responseComm = await StoreRoomTypeApi.getStoreRoomTypeInfo(
      _roomId,
    );
    if (responseComm.Code == 0) {
      StoreRoomType storeRoomType = StoreRoomType.fromJson(responseComm.Data);
      _imageUrls = storeRoomType.imageUrls.split(",");
      setState(() {
        _storeRoomType = storeRoomType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Column(
        children: [
          _buildRoomInfoSection(),
          _buildActionButtons(),
          _buildDateSection(),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildDateItem(_checkInDate, '今天', true),
                Container(
                  width: 10,
                  height: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                _buildDateItem(_checkOutDate, '明天', false),
                _nightText(),
              ],
            ),
          ),

          TextButton(
            onPressed: widget.onRoomDetailTap,
            child: Row(
              children: [
                Text(
                  '房型详情',
                  style: TextStyle(fontSize: textSize, color: primaryColor),
                ),
                Icon(Icons.chevron_right, color: primaryColor, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String date, String label, bool isCheckIn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(
            fontSize: textTitleSize,
            fontWeight: FontWeight.bold,
            color: isCheckIn ? primaryColor : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildRoomInfoSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(containerRadian)
            ),
            child: _imageUrls.isNotEmpty
                ? Image.network(
                    _imageUrls[0],
                    width: 100,
                    height: 80,
                    fit: BoxFit.fill,
                    loadingBuilder:
                        (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) return child;
                          return _buildDefaultAvatar();
                        },
                    errorBuilder:
                        (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) {
                          return _buildDefaultAvatar();
                        },
                  )
                : SizedBox(
                    width: 100,
                    height: 80,
                    child: _buildDefaultAvatar(),
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _storeRoomType.name,
                style: TextStyle(
                  fontSize: textTitleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "${_storeRoomType.bedType} | 可住${_storeRoomType.maxGuestCount}人 | ${_storeRoomType.name} | ${_storeRoomType.area}m² |",
                style: TextStyle(fontSize: textSize, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: Icon(Icons.person, color: Colors.grey[500], size: 60),
    );
  }

  Widget _nightText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerBigRadian),
        border: BoxBorder.all(width: 1, color: backgroundColor as Color),
      ),
      child: Text('$_nightNum晚', style: TextStyle(fontSize: textSize)),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.cancelPolicy,
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: widget.onBookingReadTap,
            child: Row(
              children: [
                Text(
                  '订房必读',
                  style: TextStyle(fontSize: textSize, color: primaryColor),
                ),
                Icon(Icons.chevron_right, color: primaryColor, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
