import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/main.dart';

class DetailsStore extends Store<Saint?> {

  DetailsStore() : super(null);

  void getSaintById(int id) async {
    var saint = await client.saint.detailsById(id);
    update(saint);
  }

}