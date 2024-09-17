/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/chatgpt_endpoint.dart' as _i2;
import '../endpoints/edit_saint_endpoint.dart' as _i3;
import '../endpoints/find_saint_endpoint.dart' as _i4;
import '../endpoints/saint_endpoint.dart' as _i5;
import 'dart:typed_data' as _i6;
import 'package:sanctorum_server/src/generated/date.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'chatgpt': _i2.ChatgptEndpoint()
        ..initialize(
          server,
          'chatgpt',
          null,
        ),
      'editSaint': _i3.EditSaintEndpoint()
        ..initialize(
          server,
          'editSaint',
          null,
        ),
      'findSaint': _i4.FindSaintEndpoint()
        ..initialize(
          server,
          'findSaint',
          null,
        ),
      'saint': _i5.SaintEndpoint()
        ..initialize(
          server,
          'saint',
          null,
        ),
    };
    connectors['chatgpt'] = _i1.EndpointConnector(
      name: 'chatgpt',
      endpoint: endpoints['chatgpt']!,
      methodConnectors: {
        'generateJsonlFile': _i1.MethodConnector(
          name: 'generateJsonlFile',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatgpt'] as _i2.ChatgptEndpoint)
                  .generateJsonlFile(session),
        ),
        'uploadJsonlChatGptOutput': _i1.MethodConnector(
          name: 'uploadJsonlChatGptOutput',
          params: {
            'byteData': _i1.ParameterDescription(
              name: 'byteData',
              type: _i1.getType<_i6.ByteData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatgpt'] as _i2.ChatgptEndpoint)
                  .uploadJsonlChatGptOutput(
            session,
            params['byteData'],
          ),
        ),
      },
    );
    connectors['editSaint'] = _i1.EndpointConnector(
      name: 'editSaint',
      endpoint: endpoints['editSaint']!,
      methodConnectors: {
        'religiousName': _i1.MethodConnector(
          name: 'religiousName',
          params: {
            'newName': _i1.ParameterDescription(
              name: 'newName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).religiousName(
            session,
            params['newName'],
            params['id'],
          ),
        ),
        'saintName': _i1.MethodConnector(
          name: 'saintName',
          params: {
            'newName': _i1.ParameterDescription(
              name: 'newName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).saintName(
            session,
            params['newName'],
            params['id'],
          ),
        ),
        'title': _i1.MethodConnector(
          name: 'title',
          params: {
            'newTitle': _i1.ParameterDescription(
              name: 'newTitle',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).title(
            session,
            params['newTitle'],
            params['id'],
          ),
        ),
        'summary': _i1.MethodConnector(
          name: 'summary',
          params: {
            'newSummary': _i1.ParameterDescription(
              name: 'newSummary',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).summary(
            session,
            params['newSummary'],
            params['id'],
          ),
        ),
        'sex': _i1.MethodConnector(
          name: 'sex',
          params: {
            'newSex': _i1.ParameterDescription(
              name: 'newSex',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).sex(
            session,
            params['newSex'],
            params['id'],
          ),
        ),
        'academicTraining': _i1.MethodConnector(
          name: 'academicTraining',
          params: {
            'newAcademicTraining': _i1.ParameterDescription(
              name: 'newAcademicTraining',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint)
                  .academicTraining(
            session,
            params['newAcademicTraining'],
            params['id'],
          ),
        ),
        'prayers': _i1.MethodConnector(
          name: 'prayers',
          params: {
            'newPrayers': _i1.ParameterDescription(
              name: 'newPrayers',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint).prayers(
            session,
            params['newPrayers'],
            params['id'],
          ),
        ),
        'cononizationDate': _i1.MethodConnector(
          name: 'cononizationDate',
          params: {
            'newCononizationDate': _i1.ParameterDescription(
              name: 'newCononizationDate',
              type: _i1.getType<_i7.Date?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint)
                  .cononizationDate(
            session,
            params['newCononizationDate'],
            params['id'],
          ),
        ),
        'beatificationDate': _i1.MethodConnector(
          name: 'beatificationDate',
          params: {
            'newBeatificationDate': _i1.ParameterDescription(
              name: 'newBeatificationDate',
              type: _i1.getType<_i7.Date?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editSaint'] as _i3.EditSaintEndpoint)
                  .beatificationDate(
            session,
            params['newBeatificationDate'],
            params['id'],
          ),
        ),
      },
    );
    connectors['findSaint'] = _i1.EndpointConnector(
      name: 'findSaint',
      endpoint: endpoints['findSaint']!,
      methodConnectors: {
        'findSaintsWikipedia': _i1.MethodConnector(
          name: 'findSaintsWikipedia',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['findSaint'] as _i4.FindSaintEndpoint)
                  .findSaintsWikipedia(session),
        ),
        'updateFullTextsFromSavedWikipediaHtmls': _i1.MethodConnector(
          name: 'updateFullTextsFromSavedWikipediaHtmls',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['findSaint'] as _i4.FindSaintEndpoint)
                  .updateFullTextsFromSavedWikipediaHtmls(session),
        ),
      },
    );
    connectors['saint'] = _i1.EndpointConnector(
      name: 'saint',
      endpoint: endpoints['saint']!,
      methodConnectors: {
        'allSaints': _i1.MethodConnector(
          name: 'allSaints',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['saint'] as _i5.SaintEndpoint).allSaints(
            session,
            params['page'],
          ),
        ),
        'search': _i1.MethodConnector(
          name: 'search',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['saint'] as _i5.SaintEndpoint).search(
            session,
            params['query'],
            params['page'],
          ),
        ),
        'detailsById': _i1.MethodConnector(
          name: 'detailsById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['saint'] as _i5.SaintEndpoint).detailsById(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
