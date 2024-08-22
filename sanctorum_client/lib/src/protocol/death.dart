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

abstract class Death implements _i1.SerializableModel {
  Death._({
    this.id,
    this.period,
    this.country,
    this.city,
    this.details,
    this.correspondentActualCountry,
    this.isMartir,
    this.causeOfdeath,
  });

  factory Death({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
    bool? isMartir,
    String? causeOfdeath,
  }) = _DeathImpl;

  factory Death.fromJson(Map<String, dynamic> jsonSerialization) {
    return Death(
      id: jsonSerialization['id'] as int?,
      period: (jsonSerialization['period'] as List?)
          ?.map((e) => _i2.Date.fromJson((e as Map<String, dynamic>)))
          .toList(),
      country: jsonSerialization['country'] as String?,
      city: jsonSerialization['city'] as String?,
      details: jsonSerialization['details'] as String?,
      correspondentActualCountry:
          jsonSerialization['correspondentActualCountry'] as String?,
      isMartir: jsonSerialization['isMartir'] as bool?,
      causeOfdeath: jsonSerialization['causeOfdeath'] as String?,
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

  bool? isMartir;

  String? causeOfdeath;

  Death copyWith({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
    bool? isMartir,
    String? causeOfdeath,
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
      if (isMartir != null) 'isMartir': isMartir,
      if (causeOfdeath != null) 'causeOfdeath': causeOfdeath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeathImpl extends Death {
  _DeathImpl({
    int? id,
    List<_i2.Date>? period,
    String? country,
    String? city,
    String? details,
    String? correspondentActualCountry,
    bool? isMartir,
    String? causeOfdeath,
  }) : super._(
          id: id,
          period: period,
          country: country,
          city: city,
          details: details,
          correspondentActualCountry: correspondentActualCountry,
          isMartir: isMartir,
          causeOfdeath: causeOfdeath,
        );

  @override
  Death copyWith({
    Object? id = _Undefined,
    Object? period = _Undefined,
    Object? country = _Undefined,
    Object? city = _Undefined,
    Object? details = _Undefined,
    Object? correspondentActualCountry = _Undefined,
    Object? isMartir = _Undefined,
    Object? causeOfdeath = _Undefined,
  }) {
    return Death(
      id: id is int? ? id : this.id,
      period: period is List<_i2.Date>? ? period : this.period?.clone(),
      country: country is String? ? country : this.country,
      city: city is String? ? city : this.city,
      details: details is String? ? details : this.details,
      correspondentActualCountry: correspondentActualCountry is String?
          ? correspondentActualCountry
          : this.correspondentActualCountry,
      isMartir: isMartir is bool? ? isMartir : this.isMartir,
      causeOfdeath: causeOfdeath is String? ? causeOfdeath : this.causeOfdeath,
    );
  }
}
