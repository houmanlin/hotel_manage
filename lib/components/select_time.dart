import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/util/select_time_range.dart';
import 'package:hotel_manage/util/system_params.dart';

class SelectTimeRang extends StatefulWidget {
  const SelectTimeRang({super.key});

  @override
  State<SelectTimeRang> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTimeRang> {
  List<DateTime?> _selectedDates = [
    selectTimeRangeSingle.getSelectStartTime(),
    selectTimeRangeSingle.getSelectEndTime(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDates = [
      selectTimeRangeSingle.getSelectStartTime(),
      selectTimeRangeSingle.getSelectEndTime(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        dayBuilder: _dayBuild,
        calendarViewMode: CalendarDatePicker2Mode.scroll,
        calendarType: CalendarDatePicker2Type.range,
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        firstDayOfWeek: 1,
      ),
      value: _selectedDates,
      onValueChanged: (dates) {
        if (dates.length >= 2) {
          selectTimeRangeSingle.setSelectStartTime(dates[0]);
          selectTimeRangeSingle.setSelectEndTime(dates[1]);
          selectTimeRangeSingle.setCountNight();
        }
        setState(() => _selectedDates = dates);
      },
    );
  }

  Widget? _dayBuild({
    required DateTime date,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    bool? isSelected,
    bool? isDisabled,
    bool? isToday,
  }) {
    if (isSelected == true) {
      return _dayCommBuild(date, textStyle, primaryColor);
    }
    if (isToday == true) {
      return _dayCommBuild(date, TextStyle(color: Colors.black54,fontSize: 12), Colors.transparent);
    }
    return _dayCommBuild(date, textStyle, Colors.transparent);
  }
  Widget _dayCommBuild(
    DateTime date,
    TextStyle? textStyle,
    Color backgroundColor,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                date.day.toString(),
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
