import 'package:flutter_triple/flutter_triple.dart';

class EditStringStore extends Store<String?> {

  EditStringStore() : super(null);

  void updateName(String newString) async {
    update(newString);
  }

}