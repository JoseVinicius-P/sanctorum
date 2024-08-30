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
import '../endpoints/find_saint_endpoint.dart' as _i3;
import '../endpoints/list_saint_endpoint.dart' as _i4;
import 'dart:typed_data' as _i5;

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
      'findSaint': _i3.FindSaintEndpoint()
        ..initialize(
          server,
          'findSaint',
          null,
        ),
      'listSaint': _i4.ListSaintEndpoint()
        ..initialize(
          server,
          'listSaint',
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
              type: _i1.getType<_i5.ByteData>(),
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
              (endpoints['findSaint'] as _i3.FindSaintEndpoint)
                  .findSaintsWikipedia(session),
        ),
        'updateFullTextsFromSavedWikipediaHtmls': _i1.MethodConnector(
          name: 'updateFullTextsFromSavedWikipediaHtmls',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['findSaint'] as _i3.FindSaintEndpoint)
                  .updateFullTextsFromSavedWikipediaHtmls(session),
        ),
        'findSaintsVatican': _i1.MethodConnector(
          name: 'findSaintsVatican',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['findSaint'] as _i3.FindSaintEndpoint)
                  .findSaintsVatican(session),
        ),
      },
    );
    connectors['listSaint'] = _i1.EndpointConnector(
      name: 'listSaint',
      endpoint: endpoints['listSaint']!,
      methodConnectors: {
        'allSaints': _i1.MethodConnector(
          name: 'allSaints',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['listSaint'] as _i4.ListSaintEndpoint)
                  .allSaints(session),
        )
      },
    );
  }
}
