/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class EcclesiasticalHierarchy implements _i1.SerializableModel {
  EcclesiasticalHierarchy._({
    this.id,
    this.hiearchyName,
    this.details,
  });

  factory EcclesiasticalHierarchy({
    int? id,
    String? hiearchyName,
    String? details,
  }) = _EcclesiasticalHierarchyImpl;

  factory EcclesiasticalHierarchy.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return EcclesiasticalHierarchy(
      id: jsonSerialization['id'] as int?,
      hiearchyName: jsonSerialization['hiearchyName'] as String?,
      details: jsonSerialization['details'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? hiearchyName;

  String? details;

  EcclesiasticalHierarchy copyWith({
    int? id,
    String? hiearchyName,
    String? details,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (hiearchyName != null) 'hiearchyName': hiearchyName,
      if (details != null) 'details': details,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EcclesiasticalHierarchyImpl extends EcclesiasticalHierarchy {
  _EcclesiasticalHierarchyImpl({
    int? id,
    String? hiearchyName,
    String? details,
  }) : super._(
          id: id,
          hiearchyName: hiearchyName,
          details: details,
        );

  @override
  EcclesiasticalHierarchy copyWith({
    Object? id = _Undefined,
    Object? hiearchyName = _Undefined,
    Object? details = _Undefined,
  }) {
    return EcclesiasticalHierarchy(
      id: id is int? ? id : this.id,
      hiearchyName: hiearchyName is String? ? hiearchyName : this.hiearchyName,
      details: details is String? ? details : this.details,
    );
  }
}
