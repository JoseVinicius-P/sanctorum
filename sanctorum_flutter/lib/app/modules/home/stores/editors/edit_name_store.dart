import 'package:flutter_triple/flutter_triple.dart';

class EditNameStore extends Store<String?> {

  EditNameStore() : super(null);

  void updateName(String name) async {
    update(name);
  }

}