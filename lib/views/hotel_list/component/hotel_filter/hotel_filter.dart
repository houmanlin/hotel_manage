import 'package:flutter/material.dart';
import 'package:hotel_manage/components/select_time.dart';
import 'package:hotel_manage/util/system_params.dart';
import 'package:intl/intl.dart';

class HotelFilter extends StatefulWidget {
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final String? hotelName;
  final String? roomType;
  final void Function()? onSearch;
  final void Function(String, String)? onDateChanged;

  const HotelFilter({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    this.hotelName,
    this.roomType,
    this.onSearch,
    this.onDateChanged,
  });

  @override
  State<HotelFilter> createState() => _HotelFilterState();
}

class _HotelFilterState extends State<HotelFilter> {
  List<DateTime?> _selectedDates = [];
  String _checkInDate = "";
  String _checkOutDate = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkInDate = DateFormat("MM月dd日").format(widget.checkInDate);
    _checkOutDate = DateFormat("MM月dd日").format(widget.checkOutDate);
  }

  void _showDatePicker() {
    _selectedDates = [
      widget.checkInDate,
      widget.checkOutDate,
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDatePickerHeader(),
              SizedBox(
                height: 400,
                child: SelectTimeRang(),
              ),
              _buildDatePickerFooter(),
            ],
          ),
        );
      },
    );
  }
  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final weekdays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return '${weekdays[date.weekday % 7]}';
  }

  Widget _buildDatePickerHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(245, 245, 245, 1)),
        ),
      ),
      child: Row(
        children: const [
          Text(
            '选择日期',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text('共${0}晚', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildDatePickerFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromRGBO(245, 245, 245, 1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[100],
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(containerCircle),
                ),
                elevation: 0,
              ),
              child: const Text('取消'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _selectedDates.length >= 2
                  ? () {
                      Navigator.pop(context);
                      if (widget.onDateChanged != null) {
                        widget.onDateChanged!(
                          _formatDate(_selectedDates[0]),
                          _formatDate(_selectedDates[1]),
                        );
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(containerCircle),
                ),
                elevation: 0,
              ),
              child: const Text('确定'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(containerRadian),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDateRow(),
          SizedBox(height: 16),
          _buildInputRow(),
          SizedBox(height: 16),
          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildDateRow() {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '入住日期',
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _checkInDate,
                      style: TextStyle(
                        fontSize: textTitleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      _formatDate(widget.checkInDate),
                      style: TextStyle(
                        fontSize: textSmallSize,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(containerCircle),
            ),
            child: Icon(Icons.swap_horiz, size: 16, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '离店日期',
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _checkOutDate,
                      style: TextStyle(
                        fontSize: textTitleSize,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      _formatDate(widget.checkOutDate),
                      style: TextStyle(
                        fontSize: textSmallSize,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '您想酒店（请输入关键词）',
            hintStyle: TextStyle(fontSize: textSize, color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search, size: 16, color: Colors.grey[400]),
            suffixIcon: Icon(
              Icons.location_on,
              size: 16,
              color: Colors.grey[400],
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerSmallRadian),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
          style: TextStyle(fontSize: textSize),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: '您想（请输入房型）',
            hintStyle: TextStyle(fontSize: textSize, color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerSmallRadian),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: widget.onSearch,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(containerCircle),
          ),
          elevation: 0,
        ),
        child: Text(
          '查找房型',
          style: TextStyle(
            fontSize: textTitleSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
