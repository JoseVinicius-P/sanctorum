/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Date implements _i1.SerializableModel {
  Date._({
    this.id,
    required this.year,
    required this.month,
    required this.day,
  });

  factory Date({
    int? id,
    required int year,
    required int month,
    required int day,
  }) = _DateImpl;

  factory Date.fromJson(Map<String, dynamic> jsonSerialization) {
    return Date(
      id: jsonSerialization['id'] as int?,
      year: jsonSerialization['year'] as int,
      month: jsonSerialization['month'] as int,
      day: jsonSerialization['day'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int year;

  int month;

  int day;

  Date copyWith({
    int? id,
    int? year,
    int? month,
    int? day,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'year': year,
      'month': month,
      'day': day,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DateImpl extends Date {
  _DateImpl({
    int? id,
    required int year,
    required int month,
    required int day,
  }) : super._(
          id: id,
          year: year,
          month: month,
          day: day,
        );

  @override
  Date copyWith({
    Object? id = _Undefined,
    int? year,
    int? month,
    int? day,
  }) {
    return Date(
      id: id is int? ? id : this.id,
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }
}
