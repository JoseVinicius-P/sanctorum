import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';

class EditFamilyStore extends Store<Family?> {

  EditFamilyStore() : super(null);

  void updateFamily(Family? newFamily) async {
    update(newFamily);
  }

}