import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

class EditStringStore extends Store<String> {

  EditStringStore() : super('');

  void updateString(String? newString){
    newString ??= '';
    update(newString);
  }

}