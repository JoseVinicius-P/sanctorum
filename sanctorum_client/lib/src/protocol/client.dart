/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'dart:typed_data' as _i3;
import 'package:sanctorum_client/src/protocol/saint.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointChatgpt extends _i1.EndpointRef {
  EndpointChatgpt(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chatgpt';

  _i2.Future<_i3.ByteData> generateJsonlFile() =>
      caller.callServerEndpoint<_i3.ByteData>(
        'chatgpt',
        'generateJsonlFile',
        {},
      );

  _i2.Future<String> uploadJsonlChatGptOutput(_i3.ByteData byteData) =>
      caller.callServerEndpoint<String>(
        'chatgpt',
        'uploadJsonlChatGptOutput',
        {'byteData': byteData},
      );
}

/// {@category Endpoint}
class EndpointFindSaint extends _i1.EndpointRef {
  EndpointFindSaint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'findSaint';

  _i2.Future<String> findSaintsWikipedia() => caller.callServerEndpoint<String>(
        'findSaint',
        'findSaintsWikipedia',
        {},
      );

  _i2.Future<String> updateFullTextsFromSavedWikipediaHtmls() =>
      caller.callServerEndpoint<String>(
        'findSaint',
        'updateFullTextsFromSavedWikipediaHtmls',
        {},
      );

  _i2.Future<void> findSaintsVatican() => caller.callServerEndpoint<void>(
        'findSaint',
        'findSaintsVatican',
        {},
      );
}

/// {@category Endpoint}
class EndpointListSaint extends _i1.EndpointRef {
  EndpointListSaint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'listSaint';

  _i2.Future<List<_i4.Saint>> allSaints() =>
      caller.callServerEndpoint<List<_i4.Saint>>(
        'listSaint',
        'allSaints',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    chatgpt = EndpointChatgpt(this);
    findSaint = EndpointFindSaint(this);
    listSaint = EndpointListSaint(this);
  }

  late final EndpointChatgpt chatgpt;

  late final EndpointFindSaint findSaint;

  late final EndpointListSaint listSaint;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'chatgpt': chatgpt,
        'findSaint': findSaint,
        'listSaint': listSaint,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
