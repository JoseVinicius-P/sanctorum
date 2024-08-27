import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_module.dart';
 
void main() {

  setUpAll(() {
    initModule(ControlPanelModule());
  });
}