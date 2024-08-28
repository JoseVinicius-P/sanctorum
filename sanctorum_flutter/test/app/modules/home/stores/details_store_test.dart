import 'package:flutter_test/flutter_test.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/details_store.dart';
 
void main() {
  late DetailsStore store;

  setUpAll(() {
    store = DetailsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}