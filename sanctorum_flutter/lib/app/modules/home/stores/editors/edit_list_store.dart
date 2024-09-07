import 'package:flutter_triple/flutter_triple.dart';

class EditListStore extends Store<List> {

  EditListStore() : super([]);

  void updateItem(int index, dynamic newItem) async {
    state[index] = newItem;
    update(List.from(state));
  }

  void removeItem(int index) async {
    state.removeAt(index);
    update(List.from(state));
  }

  void insertItem(dynamic newItem) async {
    if(newItem != null){
      state.add(newItem);
      update(List.from(state));
    }
  }

  void updateList(List<dynamic> list) async {
    update(list);
  }

}