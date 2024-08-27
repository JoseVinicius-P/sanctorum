import 'package:flutter_test/flutter_test.dart';
import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_store.dart';
 
void main() {
  late ControlPanelStore store;

  setUpAll(() {
    store = ControlPanelStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}