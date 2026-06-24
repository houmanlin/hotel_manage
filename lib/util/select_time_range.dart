class SelectTimeRange {
  DateTime SelectStartTime = DateTime.now();
  DateTime SelectEndTime = DateTime.now();
  int CountNight = 1;

  SelectTimeRange(){
    DateTime _dateTime = DateTime.now();
    SelectStartTime = _dateTime;
    _dateTime = _dateTime.add(Duration(days: 1));
    SelectEndTime = _dateTime;
    CountNight = 1;
  }

  void setSelectStartTime(DateTime date){
    SelectStartTime = date;
  }

  void setSelectEndTime(DateTime date){
    SelectEndTime = date;
  }

  void setCountNight(){
    if(SelectStartTime.isAfter(SelectEndTime)){
      return;
    }
    int nightNum = SelectEndTime.difference(SelectStartTime).inDays;
    CountNight = nightNum > 0 ? nightNum : 0;
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