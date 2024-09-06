import 'package:flutter_triple/flutter_triple.dart';

enum Sex{
  M,F
}

class EditSexStore extends Store<Sex?> {

  EditSexStore() : super(null);

  void updateSex(Sex? sex) async {
    update(sex);
  }

}