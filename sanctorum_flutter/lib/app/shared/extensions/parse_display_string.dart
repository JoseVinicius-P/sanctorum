import 'package:sanctorum_client/sanctorum_client.dart';

extension ParseDisplayString on Saint{
  String? get academicTrainingToDisplayString{
    if(academicTraining != null && academicTraining!.isNotEmpty){
      String formation = '';
      for(var form in academicTraining!){
        formation += "$form, ";
      }

      return formation.substring(0, formation.length - 2);
    }else{
      return null;
    }
  }

  String? get beatificationDateToDisplayString{
    if(beatificationDate != null){
      return dateToString(beatificationDate!);
    }else{
      return null;
    }
  }

  String? get canonizationDateToDisplayString{
    if(cononizationDate != null){
      return dateToString(cononizationDate!);
    }else{
      return null;
    }
  }

  String? periodToDisplayString(List<Date>? period){
    if(period != null){
      if(period.length == 1){
        return dateToString(period.first);
      }else if(period.length >= 2){
        period.removeWhere((e) => e.year == 0 && e.month == 0 && e.day == 0);
        if(period.length >= 2){
          return "${dateToString(period.first)} a ${dateToString(period.last)}";
        }else{
          return periodToDisplayString(period);
        }
      }else{
        return null;
      }
    }else{
      return null;
    }

  }

  String? dateToString(Date date){
    String dateString = '';
    if(date.day != 0){
      dateString += date.day.toString().padLeft(2, '0');
    }

    if(date.month != 0){
      dateString += "/${date.month.toString().padLeft(2, '0')}";
    }

    if(date.year != 0){
      dateString += "/${date.year.abs().toString().padLeft(2, '0')}";

      if(date.year < 0){
        dateString += " a.C";
      }
    }

    //retira barras sobressalentes
    while(dateString.startsWith('/')){
      dateString = dateString.substring(1);
    }

    while(dateString.endsWith('/')){
      dateString = dateString.substring(0, dateString.length-1);
    }

    return dateString.isNotEmpty ? dateString : null;
  }
}