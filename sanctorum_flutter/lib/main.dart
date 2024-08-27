import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));