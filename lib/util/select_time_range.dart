class SelectTimeRange {
  DateTime SelectStartTime = DateTime.now();
  DateTime SelectEndTime = DateTime.now();
  int CountNight = 1;

  SelectTimeRange(){
    DateTime _dateTime = DateTime.now();
    SelectStartTime = _dateTime;
    _dateTime.add(Duration(days: 1));
    SelectEndTime = _dateTime;
    CountNight = 1;
  }

  void setSelectStartTime(DateTime date){
    SelectStartTime = date;
  }

  void setSelectEndTime(DateTime date){
    SelectEndTime = date;
  }

  void setCountNight(int nightNum){
    CountNight = nightNum;
  }


  DateTime getSelectStartTime(){
    return SelectStartTime;
  }

  DateTime getSelectEndTime(){
    return SelectEndTime;
  }

  int getCountNight(){
    return CountNight;
  }
}

SelectTimeRange selectTimeRangeSingle = SelectTimeRange();