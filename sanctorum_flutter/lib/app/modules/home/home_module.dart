import 'package:sanctorum_flutter/app/modules/home/pages/details_page.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sanctorum_flutter/app/modules/control_panel/control_panel_module.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_birth_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_date_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_list_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_list_string_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_sex_store.dart';
import 'package:sanctorum_flutter/app/modules/home/stores/editors/edit_string_store.dart';
import 'stores/home_store.dart';

import 'pages/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => DetailsStore()),
    Bind.factory((i) => EditStringStore()),
    Bind.factory((i) => EditSexStore()),
    Bind.factory((i) => EditListStringStore()),
    Bind.factory((i) => EditListStore()),
    Bind.factory((i) => EditDateStore()),
    Bind.factory((i) => EditBirthStore()),
    Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
   ChildRoute('/details/:id', child: (_, args) => DetailsPage(saintId: int.parse(args.params['id']))),
   ModuleRoute('/control_panel', module: ControlPanelModule())
 ];
}