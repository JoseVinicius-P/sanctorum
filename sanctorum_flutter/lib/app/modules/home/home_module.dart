import 'package:sanctorum_flutter/app/modules/home/pages/details_page.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_module.dart';
import 'stores/home_store.dart';

import 'pages/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DetailsStore()),
    Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
   ChildRoute('/details', child: (_, args) => DetailsPage(saintId: args.data)),
   ModuleRoute('/control_panel', module: ControlPanelModule())
 ];
}