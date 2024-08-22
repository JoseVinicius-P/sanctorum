/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class Birth implements _i1.SerializableModel {
  Birth._({
    this.id,
    this.period,
    this.country,
    this.city,
    this.details,
    this.correspondentActualCountry,
  });

  factory Birth({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
  }) = _BirthImpl;

  factory Birth.fromJson(Map<String, dynamic> jsonSerialization) {
    return Birth(
      id: jsonSerialization['id'] as int?,
      period: (jsonSerialization['period'] as List?)
          ?.map((e) => _i2.Date.fromJson((e as Map<String, dynamic>)))
          .toList(),
      country: jsonSerialization['country'] as String?,
      city: jsonSerialization['city'] as String?,
      details: jsonSerialization['details'] as String?,
      correspondentActualCountry:
          jsonSerialization['correspondentActualCountry'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<_i2.Date>? period;

  String? country;

  String? city;

  String? details;

  String? correspondentActualCountry;

  Birth copyWith({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (period != null)
        'period': period?.toJson(valueToJson: (v) => v.toJson()),
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (details != null) 'details': details,
      if (correspondentActualCountry != null)
        'correspondentActualCountry': correspondentActualCountry,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BirthImpl extends Birth {
  _BirthImpl({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
  }) : super._(
          id: id,
          period: period,
          country: country,
          city: city,
          details: details,
          correspondentActualCountry: correspondentActualCountry,
        );

  @override
  Birth copyWith({
    Object? id = _Undefined,
    Object? period = _Undefined,
    Object? country = _Undefined,
    Object? city = _Undefined,
    Object? details = _Undefined,
    Object? correspondentActualCountry = _Undefined,
  }) {
    return Birth(
      id: id is int? ? id : this.id,
      period: period is List<_i2.Date>? ? period : this.period?.clone(),
      country: country is String? ? country : this.country,
      city: city is String? ? city : this.city,
      details: details is String? ? details : this.details,
      correspondentActualCountry: correspondentActualCountry is String?
          ? correspondentActualCountry
          : this.correspondentActualCountry,
    );
  }
}
