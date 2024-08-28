import 'dart:math';

import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/find_data_in_wikipedia_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/repositories/image_repository.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/find_data_service.dart';
import 'package:sanctorum_server/src/endpoints/find_saint_classes/services/image_service.dart';
import 'package:sanctorum_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';



class SaintEndpoint extends Endpoint {
  final int saintsPerPage = 30;

  Future<List<Saint>> allSaints(Session session, int page) async {
    
    return await Saint.db.find(
      session,
      orderBy: (t) => t.id,
      limit: saintsPerPage,
      offset: (page - 1) * saintsPerPage,
    );
  }

  Future<List<Saint>> search(Session session, String query, int page) async {

    List<String> parts = query.trim().split(' ');
    query = '';
    for(var part in parts){
      query += '%$part';
    }
    query += '%';

    return await Saint.db.find(
      session,
      where: (t) => t.name.ilike(query) | t.religiousName.ilike(query),
      limit: saintsPerPage,
      offset: (page - 1) * saintsPerPage,
    );
  }

  Future<Saint?> detailsById(Session session, int id) async {
    return await Saint.db.findById(
      session, 
      id, 
      include: Saint.include(
        birth: Birth.include(),
        death: Death.include(),
        family: Family.include(),
        ecclesiasticalHierarchy: EcclesiasticalHierarchy.includeList(),
        miracles: Miracle.includeList(),
        quotations: Quotation.includeList(),
        religiousEvents: ReligiousEvent.includeList(),
        veneration: Veneration.include(),
      )
    );
  }

}
