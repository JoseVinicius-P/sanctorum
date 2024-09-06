import 'package:flutter_triple/flutter_triple.dart';

class EditListStringStore extends Store<List<String>> {

  EditListStringStore() : super([]);

  void updateItem(int index, String newString) async {
    state[index] = newString;
    update(List.from(state));
  }

  void removeItem(int index) async {
    state.removeAt(index);
    update(List.from(state));
  }

  void insertItem(String newString) async {
    state.add(newString);
    update(List.from(state));
  }

  void updateList(List<String> list) async {
    update(list);
  }

}