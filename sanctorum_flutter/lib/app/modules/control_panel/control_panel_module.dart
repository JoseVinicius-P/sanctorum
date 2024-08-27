import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_page.dart';
import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ControlPanelModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => ControlPanelStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => ControlPanelPage()),];

}