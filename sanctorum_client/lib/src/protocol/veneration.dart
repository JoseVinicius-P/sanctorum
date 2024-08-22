/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Veneration implements _i1.SerializableModel {
  Veneration._({
    this.id,
    this.celebrationDate,
    this.legacy,
  });

  factory Veneration({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  }) = _VenerationImpl;

  factory Veneration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Veneration(
      id: jsonSerialization['id'] as int?,
      celebrationDate: (jsonSerialization['celebrationDate'] as List?)
          ?.map((e) => e as String)
          .toList(),
      legacy: jsonSerialization['legacy'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<String>? celebrationDate;

  String? legacy;

  Veneration copyWith({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (celebrationDate != null) 'celebrationDate': celebrationDate?.toJson(),
      if (legacy != null) 'legacy': legacy,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VenerationImpl extends Veneration {
  _VenerationImpl({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  }) : super._(
          id: id,
          celebrationDate: celebrationDate,
          legacy: legacy,
        );

  @override
  Veneration copyWith({
    Object? id = _Undefined,
    Object? celebrationDate = _Undefined,
    Object? legacy = _Undefined,
  }) {
    return Veneration(
      id: id is int? ? id : this.id,
      celebrationDate: celebrationDate is List<String>?
          ? celebrationDate
          : this.celebrationDate?.clone(),
      legacy: legacy is String? ? legacy : this.legacy,
    );
  }
}
