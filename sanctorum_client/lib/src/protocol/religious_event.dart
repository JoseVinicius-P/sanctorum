/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ReligiousEvent implements _i1.SerializableModel {
  ReligiousEvent._({
    this.id,
    this.year,
    this.event,
  });

  factory ReligiousEvent({
    int? id,
    int? year,
    String? event,
  }) = _ReligiousEventImpl;

  factory ReligiousEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReligiousEvent(
      id: jsonSerialization['id'] as int?,
      year: jsonSerialization['year'] as int?,
      event: jsonSerialization['event'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? year;

  String? event;

  ReligiousEvent copyWith({
    int? id,
    int? year,
    String? event,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (event != null) 'event': event,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReligiousEventImpl extends ReligiousEvent {
  _ReligiousEventImpl({
    int? id,
    int? year,
    String? event,
  }) : super._(
          id: id,
          year: year,
          event: event,
        );

  @override
  ReligiousEvent copyWith({
    Object? id = _Undefined,
    Object? year = _Undefined,
    Object? event = _Undefined,
  }) {
    return ReligiousEvent(
      id: id is int? ? id : this.id,
      year: year is int? ? year : this.year,
      event: event is String? ? event : this.event,
    );
  }
}
