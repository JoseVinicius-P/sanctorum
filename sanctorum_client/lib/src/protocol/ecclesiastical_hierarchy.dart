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
    this.mother,
    this.father,
    this.numberOfSiblings,
  });

  factory EcclesiasticalHierarchy({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  }) = _EcclesiasticalHierarchyImpl;

  factory EcclesiasticalHierarchy.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return EcclesiasticalHierarchy(
      id: jsonSerialization['id'] as int?,
      mother: jsonSerialization['mother'] as String?,
      father: jsonSerialization['father'] as String?,
      numberOfSiblings: jsonSerialization['numberOfSiblings'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? mother;

  String? father;

  int? numberOfSiblings;

  EcclesiasticalHierarchy copyWith({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (mother != null) 'mother': mother,
      if (father != null) 'father': father,
      if (numberOfSiblings != null) 'numberOfSiblings': numberOfSiblings,
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
    String? mother,
    String? father,
    int? numberOfSiblings,
  }) : super._(
          id: id,
          mother: mother,
          father: father,
          numberOfSiblings: numberOfSiblings,
        );

  @override
  EcclesiasticalHierarchy copyWith({
    Object? id = _Undefined,
    Object? mother = _Undefined,
    Object? father = _Undefined,
    Object? numberOfSiblings = _Undefined,
  }) {
    return EcclesiasticalHierarchy(
      id: id is int? ? id : this.id,
      mother: mother is String? ? mother : this.mother,
      father: father is String? ? father : this.father,
      numberOfSiblings:
          numberOfSiblings is int? ? numberOfSiblings : this.numberOfSiblings,
    );
  }
}
