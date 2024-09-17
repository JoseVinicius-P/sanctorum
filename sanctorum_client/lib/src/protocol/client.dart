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
import 'package:sanctorum_client/src/protocol/date.dart' as _i4;
import 'package:sanctorum_client/src/protocol/saint.dart' as _i5;
import 'protocol.dart' as _i6;

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
class EndpointEditSaint extends _i1.EndpointRef {
  EndpointEditSaint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'editSaint';

  _i2.Future<bool> religiousName(
    String? newName,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'religiousName',
        {
          'newName': newName,
          'id': id,
        },
      );

  _i2.Future<bool> saintName(
    String? newName,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'saintName',
        {
          'newName': newName,
          'id': id,
        },
      );

  _i2.Future<bool> title(
    String? newTitle,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'title',
        {
          'newTitle': newTitle,
          'id': id,
        },
      );

  _i2.Future<bool> summary(
    String? newSummary,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'summary',
        {
          'newSummary': newSummary,
          'id': id,
        },
      );

  _i2.Future<bool> sex(
    String? newSex,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'sex',
        {
          'newSex': newSex,
          'id': id,
        },
      );

  _i2.Future<bool> academicTraining(
    List<String>? newAcademicTraining,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'academicTraining',
        {
          'newAcademicTraining': newAcademicTraining,
          'id': id,
        },
      );

  _i2.Future<bool> prayers(
    List<String>? newPrayers,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'prayers',
        {
          'newPrayers': newPrayers,
          'id': id,
        },
      );

  _i2.Future<bool> cononizationDate(
    _i4.Date? newCononizationDate,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'cononizationDate',
        {
          'newCononizationDate': newCononizationDate,
          'id': id,
        },
      );

  _i2.Future<bool> beatificationDate(
    _i4.Date? newBeatificationDate,
    int id,
  ) =>
      caller.callServerEndpoint<bool>(
        'editSaint',
        'beatificationDate',
        {
          'newBeatificationDate': newBeatificationDate,
          'id': id,
        },
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
}

/// {@category Endpoint}
class EndpointSaint extends _i1.EndpointRef {
  EndpointSaint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'saint';

  _i2.Future<List<_i5.Saint>> allSaints(int page) =>
      caller.callServerEndpoint<List<_i5.Saint>>(
        'saint',
        'allSaints',
        {'page': page},
      );

  _i2.Future<List<_i5.Saint>> search(
    String query,
    int page,
  ) =>
      caller.callServerEndpoint<List<_i5.Saint>>(
        'saint',
        'search',
        {
          'query': query,
          'page': page,
        },
      );

  _i2.Future<_i5.Saint?> detailsById(int id) =>
      caller.callServerEndpoint<_i5.Saint?>(
        'saint',
        'detailsById',
        {'id': id},
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    chatgpt = EndpointChatgpt(this);
    editSaint = EndpointEditSaint(this);
    findSaint = EndpointFindSaint(this);
    saint = EndpointSaint(this);
  }

  late final EndpointChatgpt chatgpt;

  late final EndpointEditSaint editSaint;

  late final EndpointFindSaint findSaint;

  late final EndpointSaint saint;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'chatgpt': chatgpt,
        'editSaint': editSaint,
        'findSaint': findSaint,
        'saint': saint,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
