import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';

class EditDateStore extends Store<Date?> {

  EditDateStore() : super(null);

  void updateDate(Date? newDate) async {
    update(newDate);
  }

}