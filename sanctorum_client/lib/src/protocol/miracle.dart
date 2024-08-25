/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Miracle implements _i1.SerializableModel {
  Miracle._({
    this.id,
    this.details,
    this.name,
  });

  factory Miracle({
    int? id,
    String? details,
    String? name,
  }) = _MiracleImpl;

  factory Miracle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Miracle(
      id: jsonSerialization['id'] as int?,
      details: jsonSerialization['details'] as String?,
      name: jsonSerialization['name'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? details;

  String? name;

  Miracle copyWith({
    int? id,
    String? details,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (details != null) 'details': details,
      if (name != null) 'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MiracleImpl extends Miracle {
  _MiracleImpl({
    int? id,
    String? details,
    String? name,
  }) : super._(
          id: id,
          details: details,
          name: name,
        );

  @override
  Miracle copyWith({
    Object? id = _Undefined,
    Object? details = _Undefined,
    Object? name = _Undefined,
  }) {
    return Miracle(
      id: id is int? ? id : this.id,
      details: details is String? ? details : this.details,
      name: name is String? ? name : this.name,
    );
  }
}
