import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class EditSaintEndpoint extends Endpoint {

  String? validateEmptyString(String? string){
    if(string != null && string.isEmpty){
      string = null;
    }
    return string;
  }

  List<String>? validateEmptyListString(List<String>? list){
    if(list != null){
      list.removeWhere((e) => e.trim().isEmpty);
      if(list.isEmpty){
        list = null;
      }
    }
    return list;
  }

  Date? validateDate(Date? date){
    if(date != null){
      if(date.year == 0 && date.month == 0 && date.day == 0){
        date = null;
      }
    }
    return date;
  }

  Future<String?> religiousName(Session session, String? newName, int id) async {
    newName = validateEmptyString(newName);
    var saint = await Saint.db.findById(session, id);
    saint!.religiousName = newName;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.religiousName]);
    print('Nome: $newName, Nome: ${saint.religiousName}');
    return saint.religiousName;
  }

  Future<String?> saintName(Session session, String newName, int id) async {
    if(newName.isNotEmpty){
      var saint = await Saint.db.findById(session, id);
      saint!.name = newName;
      saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.name]);
      return saint.name;
    }else{
      return newName;
    }
  }

  Future<String?> title(Session session, String? newTitle, int id) async {
    newTitle = validateEmptyString(newTitle);
    var saint = await Saint.db.findById(session, id);
    saint!.title = newTitle;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.title]);
    return saint.title;
  }

  Future<String?> summary(Session session, String? newSummary, int id) async {
    newSummary = validateEmptyString(newSummary);
    var saint = await Saint.db.findById(session, id);
    saint!.summary = newSummary;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.summary]);
    return saint.summary;
  }

  Future<String?> sex(Session session, String? newSex, int id) async {
    newSex = validateEmptyString(newSex);
    var saint = await Saint.db.findById(session, id);
    saint!.gender = newSex;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.gender]);
    return saint.gender;
  }

  Future<List<String>?> academicTraining(Session session, List<String>? newAcademicTraining, int id) async {
    newAcademicTraining = validateEmptyListString(newAcademicTraining);
    var saint = await Saint.db.findById(session, id);
    saint!.academicTraining = newAcademicTraining;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.academicTraining]);
    return saint.academicTraining;
  }

  Future<List<String>?> prayers(Session session, List<String>? newPrayers, int id) async {
    newPrayers = validateEmptyListString(newPrayers);
    var saint = await Saint.db.findById(session, id);
    saint!.prayers = newPrayers;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.prayers]);
    return saint.prayers;
  }

  Future<Date?> cononizationDate(Session session, Date? newCononizationDate, int id) async {
    newCononizationDate = validateDate(newCononizationDate);
    var saint = await Saint.db.findById(session, id);
    saint!.cononizationDate = newCononizationDate;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.cononizationDate]);
    return saint.cononizationDate;
  }

  Future<Date?> beatificationDate(Session session, Date? newBeatificationDate, int id) async {
    newBeatificationDate = validateDate(newBeatificationDate);
    var saint = await Saint.db.findById(session, id);
    saint!.beatificationDate = newBeatificationDate;
    saint = await Saint.db.updateRow(session, saint, columns: (t) => [t.beatificationDate]);
    return saint.beatificationDate;
  }

}
