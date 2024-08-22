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

abstract class Saint implements _i1.SerializableModel {
  Saint._({
    this.id,
    this.urlImage,
    this.name,
    this.religiousName,
    this.gender,
    this.title,
    this.birthId,
    this.birth,
    this.deathId,
    this.death,
    this.familyId,
    this.family,
    this.venerationId,
    this.veneration,
    this.academicTraining,
    this.ecclesiasticalHierarchy,
    this.cononizationDate,
    this.beatificationDate,
    this.religiousEvents,
    this.miracles,
    this.quotations,
    this.prayers,
    this.summary,
  });

  factory Saint({
    int? id,
    String? urlImage,
    String? name,
    String? religiousName,
    _i2.Gender? gender,
    String? title,
    int? birthId,
    _i2.Birth? birth,
    int? deathId,
    _i2.Death? death,
    int? familyId,
    _i2.Family? family,
    int? venerationId,
    _i2.Veneration? veneration,
    List<String>? academicTraining,
    List<_i2.EcclesiasticalHierarchy>? ecclesiasticalHierarchy,
    _i2.Date? cononizationDate,
    _i2.Date? beatificationDate,
    List<_i2.ReligiousEvent>? religiousEvents,
    List<_i2.Miracle>? miracles,
    List<_i2.Quotation>? quotations,
    List<String>? prayers,
    String? summary,
  }) = _SaintImpl;

  factory Saint.fromJson(Map<String, dynamic> jsonSerialization) {
    return Saint(
      id: jsonSerialization['id'] as int?,
      urlImage: jsonSerialization['urlImage'] as String?,
      name: jsonSerialization['name'] as String?,
      religiousName: jsonSerialization['religiousName'] as String?,
      gender: jsonSerialization['gender'] == null
          ? null
          : _i2.Gender.fromJson((jsonSerialization['gender'] as int)),
      title: jsonSerialization['title'] as String?,
      birthId: jsonSerialization['birthId'] as int?,
      birth: jsonSerialization['birth'] == null
          ? null
          : _i2.Birth.fromJson(
              (jsonSerialization['birth'] as Map<String, dynamic>)),
      deathId: jsonSerialization['deathId'] as int?,
      death: jsonSerialization['death'] == null
          ? null
          : _i2.Death.fromJson(
              (jsonSerialization['death'] as Map<String, dynamic>)),
      familyId: jsonSerialization['familyId'] as int?,
      family: jsonSerialization['family'] == null
          ? null
          : _i2.Family.fromJson(
              (jsonSerialization['family'] as Map<String, dynamic>)),
      venerationId: jsonSerialization['venerationId'] as int?,
      veneration: jsonSerialization['veneration'] == null
          ? null
          : _i2.Veneration.fromJson(
              (jsonSerialization['veneration'] as Map<String, dynamic>)),
      academicTraining: (jsonSerialization['academicTraining'] as List?)
          ?.map((e) => e as String)
          .toList(),
      ecclesiasticalHierarchy: (jsonSerialization['ecclesiasticalHierarchy']
              as List?)
          ?.map((e) =>
              _i2.EcclesiasticalHierarchy.fromJson((e as Map<String, dynamic>)))
          .toList(),
      cononizationDate: jsonSerialization['cononizationDate'] == null
          ? null
          : _i2.Date.fromJson(
              (jsonSerialization['cononizationDate'] as Map<String, dynamic>)),
      beatificationDate: jsonSerialization['beatificationDate'] == null
          ? null
          : _i2.Date.fromJson(
              (jsonSerialization['beatificationDate'] as Map<String, dynamic>)),
      religiousEvents: (jsonSerialization['religiousEvents'] as List?)
          ?.map((e) => _i2.ReligiousEvent.fromJson((e as Map<String, dynamic>)))
          .toList(),
      miracles: (jsonSerialization['miracles'] as List?)
          ?.map((e) => _i2.Miracle.fromJson((e as Map<String, dynamic>)))
          .toList(),
      quotations: (jsonSerialization['quotations'] as List?)
          ?.map((e) => _i2.Quotation.fromJson((e as Map<String, dynamic>)))
          .toList(),
      prayers: (jsonSerialization['prayers'] as List?)
          ?.map((e) => e as String)
          .toList(),
      summary: jsonSerialization['summary'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? urlImage;

  String? name;

  String? religiousName;

  _i2.Gender? gender;

  String? title;

  int? birthId;

  _i2.Birth? birth;

  int? deathId;

  _i2.Death? death;

  int? familyId;

  _i2.Family? family;

  int? venerationId;

  _i2.Veneration? veneration;

  List<String>? academicTraining;

  List<_i2.EcclesiasticalHierarchy>? ecclesiasticalHierarchy;

  _i2.Date? cononizationDate;

  _i2.Date? beatificationDate;

  List<_i2.ReligiousEvent>? religiousEvents;

  List<_i2.Miracle>? miracles;

  List<_i2.Quotation>? quotations;

  List<String>? prayers;

  String? summary;

  Saint copyWith({
    int? id,
    String? urlImage,
    String? name,
    String? religiousName,
    _i2.Gender? gender,
    String? title,
    int? birthId,
    _i2.Birth? birth,
    int? deathId,
    _i2.Death? death,
    int? familyId,
    _i2.Family? family,
    int? venerationId,
    _i2.Veneration? veneration,
    List<String>? academicTraining,
    List<_i2.EcclesiasticalHierarchy>? ecclesiasticalHierarchy,
    _i2.Date? cononizationDate,
    _i2.Date? beatificationDate,
    List<_i2.ReligiousEvent>? religiousEvents,
    List<_i2.Miracle>? miracles,
    List<_i2.Quotation>? quotations,
    List<String>? prayers,
    String? summary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (urlImage != null) 'urlImage': urlImage,
      if (name != null) 'name': name,
      if (religiousName != null) 'religiousName': religiousName,
      if (gender != null) 'gender': gender?.toJson(),
      if (title != null) 'title': title,
      if (birthId != null) 'birthId': birthId,
      if (birth != null) 'birth': birth?.toJson(),
      if (deathId != null) 'deathId': deathId,
      if (death != null) 'death': death?.toJson(),
      if (familyId != null) 'familyId': familyId,
      if (family != null) 'family': family?.toJson(),
      if (venerationId != null) 'venerationId': venerationId,
      if (veneration != null) 'veneration': veneration?.toJson(),
      if (academicTraining != null)
        'academicTraining': academicTraining?.toJson(),
      if (ecclesiasticalHierarchy != null)
        'ecclesiasticalHierarchy':
            ecclesiasticalHierarchy?.toJson(valueToJson: (v) => v.toJson()),
      if (cononizationDate != null)
        'cononizationDate': cononizationDate?.toJson(),
      if (beatificationDate != null)
        'beatificationDate': beatificationDate?.toJson(),
      if (religiousEvents != null)
        'religiousEvents':
            religiousEvents?.toJson(valueToJson: (v) => v.toJson()),
      if (miracles != null)
        'miracles': miracles?.toJson(valueToJson: (v) => v.toJson()),
      if (quotations != null)
        'quotations': quotations?.toJson(valueToJson: (v) => v.toJson()),
      if (prayers != null) 'prayers': prayers?.toJson(),
      if (summary != null) 'summary': summary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SaintImpl extends Saint {
  _SaintImpl({
    int? id,
    String? urlImage,
    String? name,
    String? religiousName,
    _i2.Gender? gender,
    String? title,
    int? birthId,
    _i2.Birth? birth,
    int? deathId,
    _i2.Death? death,
    int? familyId,
    _i2.Family? family,
    int? venerationId,
    _i2.Veneration? veneration,
    List<String>? academicTraining,
    List<_i2.EcclesiasticalHierarchy>? ecclesiasticalHierarchy,
    _i2.Date? cononizationDate,
    _i2.Date? beatificationDate,
    List<_i2.ReligiousEvent>? religiousEvents,
    List<_i2.Miracle>? miracles,
    List<_i2.Quotation>? quotations,
    List<String>? prayers,
    String? summary,
  }) : super._(
          id: id,
          urlImage: urlImage,
          name: name,
          religiousName: religiousName,
          gender: gender,
          title: title,
          birthId: birthId,
          birth: birth,
          deathId: deathId,
          death: death,
          familyId: familyId,
          family: family,
          venerationId: venerationId,
          veneration: veneration,
          academicTraining: academicTraining,
          ecclesiasticalHierarchy: ecclesiasticalHierarchy,
          cononizationDate: cononizationDate,
          beatificationDate: beatificationDate,
          religiousEvents: religiousEvents,
          miracles: miracles,
          quotations: quotations,
          prayers: prayers,
          summary: summary,
        );

  @override
  Saint copyWith({
    Object? id = _Undefined,
    Object? urlImage = _Undefined,
    Object? name = _Undefined,
    Object? religiousName = _Undefined,
    Object? gender = _Undefined,
    Object? title = _Undefined,
    Object? birthId = _Undefined,
    Object? birth = _Undefined,
    Object? deathId = _Undefined,
    Object? death = _Undefined,
    Object? familyId = _Undefined,
    Object? family = _Undefined,
    Object? venerationId = _Undefined,
    Object? veneration = _Undefined,
    Object? academicTraining = _Undefined,
    Object? ecclesiasticalHierarchy = _Undefined,
    Object? cononizationDate = _Undefined,
    Object? beatificationDate = _Undefined,
    Object? religiousEvents = _Undefined,
    Object? miracles = _Undefined,
    Object? quotations = _Undefined,
    Object? prayers = _Undefined,
    Object? summary = _Undefined,
  }) {
    return Saint(
      id: id is int? ? id : this.id,
      urlImage: urlImage is String? ? urlImage : this.urlImage,
      name: name is String? ? name : this.name,
      religiousName:
          religiousName is String? ? religiousName : this.religiousName,
      gender: gender is _i2.Gender? ? gender : this.gender,
      title: title is String? ? title : this.title,
      birthId: birthId is int? ? birthId : this.birthId,
      birth: birth is _i2.Birth? ? birth : this.birth?.copyWith(),
      deathId: deathId is int? ? deathId : this.deathId,
      death: death is _i2.Death? ? death : this.death?.copyWith(),
      familyId: familyId is int? ? familyId : this.familyId,
      family: family is _i2.Family? ? family : this.family?.copyWith(),
      venerationId: venerationId is int? ? venerationId : this.venerationId,
      veneration: veneration is _i2.Veneration?
          ? veneration
          : this.veneration?.copyWith(),
      academicTraining: academicTraining is List<String>?
          ? academicTraining
          : this.academicTraining?.clone(),
      ecclesiasticalHierarchy:
          ecclesiasticalHierarchy is List<_i2.EcclesiasticalHierarchy>?
              ? ecclesiasticalHierarchy
              : this.ecclesiasticalHierarchy?.clone(),
      cononizationDate: cononizationDate is _i2.Date?
          ? cononizationDate
          : this.cononizationDate?.copyWith(),
      beatificationDate: beatificationDate is _i2.Date?
          ? beatificationDate
          : this.beatificationDate?.copyWith(),
      religiousEvents: religiousEvents is List<_i2.ReligiousEvent>?
          ? religiousEvents
          : this.religiousEvents?.clone(),
      miracles:
          miracles is List<_i2.Miracle>? ? miracles : this.miracles?.clone(),
      quotations: quotations is List<_i2.Quotation>?
          ? quotations
          : this.quotations?.clone(),
      prayers: prayers is List<String>? ? prayers : this.prayers?.clone(),
      summary: summary is String? ? summary : this.summary,
    );
  }
}
