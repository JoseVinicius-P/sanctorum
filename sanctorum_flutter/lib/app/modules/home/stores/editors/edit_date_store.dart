import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';

class EditDateStore extends Store<Date?> {

  EditDateStore() : super(null);

  void updateDate(Date? newDate) async {
    update(verifyDate(newDate));
  }
  
  Date? verifyDate(Date? date){
    if(date != null){
      if(date.year == 0 && date.month == 0 && date.day == 0){
        return null;
      }else{
        return date;
      }
    }
    
    return date;
  }

}