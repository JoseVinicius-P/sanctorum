import 'dart:math';

import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/find_data_in_wikipedia_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/image_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/image_service.dart';
import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class EditSaintEndpoint extends Endpoint {

  String? validateEmptyString(String? string){
    if(string != null && string.isEmpty){
      string = null;
    }
    return null;
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

  Future<bool> religiousName(Session session, String? newName, int id) async {
    newName = validateEmptyString(newName);
    var saint = await Saint.db.findById(session, id);
    saint!.religiousName = newName;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.religiousName]);
    return true;
  }

  Future<bool> saintName(Session session, String newName, int id) async {
    if(newName.isNotEmpty){
      var saint = await Saint.db.findById(session, id);
      saint!.name = newName;
      await Saint.db.updateRow(session, saint, columns: (t) => [t.name]);
      return true;
    }else{
      return false;
    }
  }

  Future<bool> title(Session session, String? newTitle, int id) async {
    newTitle = validateEmptyString(newTitle);
    var saint = await Saint.db.findById(session, id);
    saint!.title = newTitle;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.title]);
    return true;
  }

  Future<bool> summary(Session session, String? newSummary, int id) async {
    newSummary = validateEmptyString(newSummary);
    var saint = await Saint.db.findById(session, id);
    saint!.summary = newSummary;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.summary]);
    return true;
  }

  Future<bool> sex(Session session, String? newSex, int id) async {
    newSex = validateEmptyString(newSex);
    var saint = await Saint.db.findById(session, id);
    saint!.gender = newSex;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.gender]);
    return true;
  }

  Future<bool> academicTraining(Session session, List<String>? newAcademicTraining, int id) async {
    newAcademicTraining = validateEmptyListString(newAcademicTraining);
    var saint = await Saint.db.findById(session, id);
    saint!.academicTraining = newAcademicTraining;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.academicTraining]);
    return true;
  }

  Future<bool> prayers(Session session, List<String>? newPrayers, int id) async {
    newPrayers = validateEmptyListString(newPrayers);
    var saint = await Saint.db.findById(session, id);
    saint!.prayers = newPrayers;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.prayers]);
    return true;
  }

  Future<bool> cononizationDate(Session session, Date? newCononizationDate, int id) async {
    newCononizationDate = validateDate(newCononizationDate);
    var saint = await Saint.db.findById(session, id);
    saint!.cononizationDate = newCononizationDate;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.cononizationDate]);
    return true;
  }

  Future<bool> beatificationDate(Session session, Date? newBeatificationDate, int id) async {
    newBeatificationDate = validateDate(newBeatificationDate);
    var saint = await Saint.db.findById(session, id);
    saint!.beatificationDate = newBeatificationDate;
    await Saint.db.updateRow(session, saint, columns: (t) => [t.beatificationDate]);
    return true;
  }

}
