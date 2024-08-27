import 'package:flutter_triple/flutter_triple.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/main.dart';

class HomeStore extends Store<List<Saint>> {
  HomeStore() : super([]);

  void fetchAllSaints() async {
    var saints = await client.listSaint.allSaints();

    update(saints);
  }
}