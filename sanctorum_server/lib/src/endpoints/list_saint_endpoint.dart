import 'dart:math';

import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/find_data_in_wikipedia_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/image_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/image_service.dart';
import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class ListSaintEndpoint extends Endpoint {


  Future<List<Saint>> allSaints(Session session) async {
    return await Saint.db.find(session);
  }

}
