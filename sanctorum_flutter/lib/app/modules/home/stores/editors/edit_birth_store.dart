import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';

class EditBirthStore extends Store<Birth?> {

  EditBirthStore() : super(null);

  void updateBirth(Birth? newBirth) async {
    update(newBirth);
  }

  void updatePeriod(List<Date>? newPeriod) async {
    state?.period = newPeriod;
    update(state, force: true);
  }

  void updateFirstDate(Date? newDate) async {
    if(newDate != null){
      if(state?.period != null){
        state!.period!.first = newDate;
      }else{
        state?.period = [newDate];
      }

      update(state, force: true);
    }
  }

  void updateLastDate(Date? newDate) async {
    if(newDate != null){
      if(state?.period != null){
        state!.period!.add(newDate);
      }
    }else{
      if((state?.period?.length ?? 0) > 1){
        state?.period?.removeLast();
      }
    }
    update(state, force: true);
  }

}