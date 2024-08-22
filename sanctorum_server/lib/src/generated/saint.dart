/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Saint extends _i1.TableRow implements _i1.ProtocolSerialization {
  Saint._({
    int? id,
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
    this.sourceLink,
    this.fullText,
    this.sourceHtml,
  }) : super(id);

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
    String? sourceLink,
    String? fullText,
    String? sourceHtml,
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
      sourceLink: jsonSerialization['sourceLink'] as String?,
      fullText: jsonSerialization['fullText'] as String?,
      sourceHtml: jsonSerialization['sourceHtml'] as String?,
    );
  }

  static final t = SaintTable();

  static const db = SaintRepository._();

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

  String? sourceLink;

  String? fullText;

  String? sourceHtml;

  @override
  _i1.Table get table => t;

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
    String? sourceLink,
    String? fullText,
    String? sourceHtml,
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
      if (sourceLink != null) 'sourceLink': sourceLink,
      if (fullText != null) 'fullText': fullText,
      if (sourceHtml != null) 'sourceHtml': sourceHtml,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (urlImage != null) 'urlImage': urlImage,
      if (name != null) 'name': name,
      if (religiousName != null) 'religiousName': religiousName,
      if (gender != null) 'gender': gender?.toJson(),
      if (title != null) 'title': title,
      if (birthId != null) 'birthId': birthId,
      if (birth != null) 'birth': birth?.toJsonForProtocol(),
      if (deathId != null) 'deathId': deathId,
      if (death != null) 'death': death?.toJsonForProtocol(),
      if (familyId != null) 'familyId': familyId,
      if (family != null) 'family': family?.toJsonForProtocol(),
      if (venerationId != null) 'venerationId': venerationId,
      if (veneration != null) 'veneration': veneration?.toJsonForProtocol(),
      if (academicTraining != null)
        'academicTraining': academicTraining?.toJson(),
      if (ecclesiasticalHierarchy != null)
        'ecclesiasticalHierarchy': ecclesiasticalHierarchy?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (cononizationDate != null)
        'cononizationDate': cononizationDate?.toJsonForProtocol(),
      if (beatificationDate != null)
        'beatificationDate': beatificationDate?.toJsonForProtocol(),
      if (religiousEvents != null)
        'religiousEvents':
            religiousEvents?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (miracles != null)
        'miracles': miracles?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (quotations != null)
        'quotations':
            quotations?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (prayers != null) 'prayers': prayers?.toJson(),
      if (summary != null) 'summary': summary,
    };
  }

  static SaintInclude include({
    _i2.BirthInclude? birth,
    _i2.DeathInclude? death,
    _i2.FamilyInclude? family,
    _i2.VenerationInclude? veneration,
    _i2.EcclesiasticalHierarchyIncludeList? ecclesiasticalHierarchy,
    _i2.ReligiousEventIncludeList? religiousEvents,
    _i2.MiracleIncludeList? miracles,
    _i2.QuotationIncludeList? quotations,
  }) {
    return SaintInclude._(
      birth: birth,
      death: death,
      family: family,
      veneration: veneration,
      ecclesiasticalHierarchy: ecclesiasticalHierarchy,
      religiousEvents: religiousEvents,
      miracles: miracles,
      quotations: quotations,
    );
  }

  static SaintIncludeList includeList({
    _i1.WhereExpressionBuilder<SaintTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaintTable>? orderByList,
    SaintInclude? include,
  }) {
    return SaintIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Saint.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Saint.t),
      include: include,
    );
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
    String? sourceLink,
    String? fullText,
    String? sourceHtml,
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
          sourceLink: sourceLink,
          fullText: fullText,
          sourceHtml: sourceHtml,
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
    Object? sourceLink = _Undefined,
    Object? fullText = _Undefined,
    Object? sourceHtml = _Undefined,
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
      sourceLink: sourceLink is String? ? sourceLink : this.sourceLink,
      fullText: fullText is String? ? fullText : this.fullText,
      sourceHtml: sourceHtml is String? ? sourceHtml : this.sourceHtml,
    );
  }
}

class SaintTable extends _i1.Table {
  SaintTable({super.tableRelation}) : super(tableName: 'saint') {
    urlImage = _i1.ColumnString(
      'urlImage',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    religiousName = _i1.ColumnString(
      'religiousName',
      this,
    );
    gender = _i1.ColumnEnum(
      'gender',
      this,
      _i1.EnumSerialization.byIndex,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    birthId = _i1.ColumnInt(
      'birthId',
      this,
    );
    deathId = _i1.ColumnInt(
      'deathId',
      this,
    );
    familyId = _i1.ColumnInt(
      'familyId',
      this,
    );
    venerationId = _i1.ColumnInt(
      'venerationId',
      this,
    );
    academicTraining = _i1.ColumnSerializable(
      'academicTraining',
      this,
    );
    cononizationDate = _i1.ColumnSerializable(
      'cononizationDate',
      this,
    );
    beatificationDate = _i1.ColumnSerializable(
      'beatificationDate',
      this,
    );
    prayers = _i1.ColumnSerializable(
      'prayers',
      this,
    );
    summary = _i1.ColumnString(
      'summary',
      this,
    );
    sourceLink = _i1.ColumnString(
      'sourceLink',
      this,
    );
    fullText = _i1.ColumnString(
      'fullText',
      this,
    );
    sourceHtml = _i1.ColumnString(
      'sourceHtml',
      this,
    );
  }

  late final _i1.ColumnString urlImage;

  late final _i1.ColumnString name;

  late final _i1.ColumnString religiousName;

  late final _i1.ColumnEnum<_i2.Gender> gender;

  late final _i1.ColumnString title;

  late final _i1.ColumnInt birthId;

  _i2.BirthTable? _birth;

  late final _i1.ColumnInt deathId;

  _i2.DeathTable? _death;

  late final _i1.ColumnInt familyId;

  _i2.FamilyTable? _family;

  late final _i1.ColumnInt venerationId;

  _i2.VenerationTable? _veneration;

  late final _i1.ColumnSerializable academicTraining;

  _i2.EcclesiasticalHierarchyTable? ___ecclesiasticalHierarchy;

  _i1.ManyRelation<_i2.EcclesiasticalHierarchyTable>? _ecclesiasticalHierarchy;

  late final _i1.ColumnSerializable cononizationDate;

  late final _i1.ColumnSerializable beatificationDate;

  _i2.ReligiousEventTable? ___religiousEvents;

  _i1.ManyRelation<_i2.ReligiousEventTable>? _religiousEvents;

  _i2.MiracleTable? ___miracles;

  _i1.ManyRelation<_i2.MiracleTable>? _miracles;

  _i2.QuotationTable? ___quotations;

  _i1.ManyRelation<_i2.QuotationTable>? _quotations;

  late final _i1.ColumnSerializable prayers;

  late final _i1.ColumnString summary;

  late final _i1.ColumnString sourceLink;

  late final _i1.ColumnString fullText;

  late final _i1.ColumnString sourceHtml;

  _i2.BirthTable get birth {
    if (_birth != null) return _birth!;
    _birth = _i1.createRelationTable(
      relationFieldName: 'birth',
      field: Saint.t.birthId,
      foreignField: _i2.Birth.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BirthTable(tableRelation: foreignTableRelation),
    );
    return _birth!;
  }

  _i2.DeathTable get death {
    if (_death != null) return _death!;
    _death = _i1.createRelationTable(
      relationFieldName: 'death',
      field: Saint.t.deathId,
      foreignField: _i2.Death.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DeathTable(tableRelation: foreignTableRelation),
    );
    return _death!;
  }

  _i2.FamilyTable get family {
    if (_family != null) return _family!;
    _family = _i1.createRelationTable(
      relationFieldName: 'family',
      field: Saint.t.familyId,
      foreignField: _i2.Family.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.FamilyTable(tableRelation: foreignTableRelation),
    );
    return _family!;
  }

  _i2.VenerationTable get veneration {
    if (_veneration != null) return _veneration!;
    _veneration = _i1.createRelationTable(
      relationFieldName: 'veneration',
      field: Saint.t.venerationId,
      foreignField: _i2.Veneration.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.VenerationTable(tableRelation: foreignTableRelation),
    );
    return _veneration!;
  }

  _i2.EcclesiasticalHierarchyTable get __ecclesiasticalHierarchy {
    if (___ecclesiasticalHierarchy != null) return ___ecclesiasticalHierarchy!;
    ___ecclesiasticalHierarchy = _i1.createRelationTable(
      relationFieldName: '__ecclesiasticalHierarchy',
      field: Saint.t.id,
      foreignField:
          _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.EcclesiasticalHierarchyTable(tableRelation: foreignTableRelation),
    );
    return ___ecclesiasticalHierarchy!;
  }

  _i2.ReligiousEventTable get __religiousEvents {
    if (___religiousEvents != null) return ___religiousEvents!;
    ___religiousEvents = _i1.createRelationTable(
      relationFieldName: '__religiousEvents',
      field: Saint.t.id,
      foreignField: _i2.ReligiousEvent.t.$_saintReligiouseventsSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ReligiousEventTable(tableRelation: foreignTableRelation),
    );
    return ___religiousEvents!;
  }

  _i2.MiracleTable get __miracles {
    if (___miracles != null) return ___miracles!;
    ___miracles = _i1.createRelationTable(
      relationFieldName: '__miracles',
      field: Saint.t.id,
      foreignField: _i2.Miracle.t.$_saintMiraclesSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MiracleTable(tableRelation: foreignTableRelation),
    );
    return ___miracles!;
  }

  _i2.QuotationTable get __quotations {
    if (___quotations != null) return ___quotations!;
    ___quotations = _i1.createRelationTable(
      relationFieldName: '__quotations',
      field: Saint.t.id,
      foreignField: _i2.Quotation.t.$_saintQuotationsSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuotationTable(tableRelation: foreignTableRelation),
    );
    return ___quotations!;
  }

  _i1.ManyRelation<_i2.EcclesiasticalHierarchyTable>
      get ecclesiasticalHierarchy {
    if (_ecclesiasticalHierarchy != null) return _ecclesiasticalHierarchy!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'ecclesiasticalHierarchy',
      field: Saint.t.id,
      foreignField:
          _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.EcclesiasticalHierarchyTable(tableRelation: foreignTableRelation),
    );
    _ecclesiasticalHierarchy =
        _i1.ManyRelation<_i2.EcclesiasticalHierarchyTable>(
      tableWithRelations: relationTable,
      table: _i2.EcclesiasticalHierarchyTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _ecclesiasticalHierarchy!;
  }

  _i1.ManyRelation<_i2.ReligiousEventTable> get religiousEvents {
    if (_religiousEvents != null) return _religiousEvents!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'religiousEvents',
      field: Saint.t.id,
      foreignField: _i2.ReligiousEvent.t.$_saintReligiouseventsSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ReligiousEventTable(tableRelation: foreignTableRelation),
    );
    _religiousEvents = _i1.ManyRelation<_i2.ReligiousEventTable>(
      tableWithRelations: relationTable,
      table: _i2.ReligiousEventTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _religiousEvents!;
  }

  _i1.ManyRelation<_i2.MiracleTable> get miracles {
    if (_miracles != null) return _miracles!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'miracles',
      field: Saint.t.id,
      foreignField: _i2.Miracle.t.$_saintMiraclesSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MiracleTable(tableRelation: foreignTableRelation),
    );
    _miracles = _i1.ManyRelation<_i2.MiracleTable>(
      tableWithRelations: relationTable,
      table: _i2.MiracleTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _miracles!;
  }

  _i1.ManyRelation<_i2.QuotationTable> get quotations {
    if (_quotations != null) return _quotations!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'quotations',
      field: Saint.t.id,
      foreignField: _i2.Quotation.t.$_saintQuotationsSaintId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuotationTable(tableRelation: foreignTableRelation),
    );
    _quotations = _i1.ManyRelation<_i2.QuotationTable>(
      tableWithRelations: relationTable,
      table: _i2.QuotationTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _quotations!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        urlImage,
        name,
        religiousName,
        gender,
        title,
        birthId,
        deathId,
        familyId,
        venerationId,
        academicTraining,
        cononizationDate,
        beatificationDate,
        prayers,
        summary,
        sourceLink,
        fullText,
        sourceHtml,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'birth') {
      return birth;
    }
    if (relationField == 'death') {
      return death;
    }
    if (relationField == 'family') {
      return family;
    }
    if (relationField == 'veneration') {
      return veneration;
    }
    if (relationField == 'ecclesiasticalHierarchy') {
      return __ecclesiasticalHierarchy;
    }
    if (relationField == 'religiousEvents') {
      return __religiousEvents;
    }
    if (relationField == 'miracles') {
      return __miracles;
    }
    if (relationField == 'quotations') {
      return __quotations;
    }
    return null;
  }
}

class SaintInclude extends _i1.IncludeObject {
  SaintInclude._({
    _i2.BirthInclude? birth,
    _i2.DeathInclude? death,
    _i2.FamilyInclude? family,
    _i2.VenerationInclude? veneration,
    _i2.EcclesiasticalHierarchyIncludeList? ecclesiasticalHierarchy,
    _i2.ReligiousEventIncludeList? religiousEvents,
    _i2.MiracleIncludeList? miracles,
    _i2.QuotationIncludeList? quotations,
  }) {
    _birth = birth;
    _death = death;
    _family = family;
    _veneration = veneration;
    _ecclesiasticalHierarchy = ecclesiasticalHierarchy;
    _religiousEvents = religiousEvents;
    _miracles = miracles;
    _quotations = quotations;
  }

  _i2.BirthInclude? _birth;

  _i2.DeathInclude? _death;

  _i2.FamilyInclude? _family;

  _i2.VenerationInclude? _veneration;

  _i2.EcclesiasticalHierarchyIncludeList? _ecclesiasticalHierarchy;

  _i2.ReligiousEventIncludeList? _religiousEvents;

  _i2.MiracleIncludeList? _miracles;

  _i2.QuotationIncludeList? _quotations;

  @override
  Map<String, _i1.Include?> get includes => {
        'birth': _birth,
        'death': _death,
        'family': _family,
        'veneration': _veneration,
        'ecclesiasticalHierarchy': _ecclesiasticalHierarchy,
        'religiousEvents': _religiousEvents,
        'miracles': _miracles,
        'quotations': _quotations,
      };

  @override
  _i1.Table get table => Saint.t;
}

class SaintIncludeList extends _i1.IncludeList {
  SaintIncludeList._({
    _i1.WhereExpressionBuilder<SaintTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Saint.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Saint.t;
}

class SaintRepository {
  const SaintRepository._();

  final attach = const SaintAttachRepository._();

  final attachRow = const SaintAttachRowRepository._();

  final detach = const SaintDetachRepository._();

  final detachRow = const SaintDetachRowRepository._();

  Future<List<Saint>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaintTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaintTable>? orderByList,
    _i1.Transaction? transaction,
    SaintInclude? include,
  }) async {
    return session.db.find<Saint>(
      where: where?.call(Saint.t),
      orderBy: orderBy?.call(Saint.t),
      orderByList: orderByList?.call(Saint.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Saint?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaintTable>? where,
    int? offset,
    _i1.OrderByBuilder<SaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SaintTable>? orderByList,
    _i1.Transaction? transaction,
    SaintInclude? include,
  }) async {
    return session.db.findFirstRow<Saint>(
      where: where?.call(Saint.t),
      orderBy: orderBy?.call(Saint.t),
      orderByList: orderByList?.call(Saint.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Saint?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SaintInclude? include,
  }) async {
    return session.db.findById<Saint>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Saint>> insert(
    _i1.Session session,
    List<Saint> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Saint>(
      rows,
      transaction: transaction,
    );
  }

  Future<Saint> insertRow(
    _i1.Session session,
    Saint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Saint>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Saint>> update(
    _i1.Session session,
    List<Saint> rows, {
    _i1.ColumnSelections<SaintTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Saint>(
      rows,
      columns: columns?.call(Saint.t),
      transaction: transaction,
    );
  }

  Future<Saint> updateRow(
    _i1.Session session,
    Saint row, {
    _i1.ColumnSelections<SaintTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Saint>(
      row,
      columns: columns?.call(Saint.t),
      transaction: transaction,
    );
  }

  Future<List<Saint>> delete(
    _i1.Session session,
    List<Saint> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Saint>(
      rows,
      transaction: transaction,
    );
  }

  Future<Saint> deleteRow(
    _i1.Session session,
    Saint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Saint>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Saint>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SaintTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Saint>(
      where: where(Saint.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SaintTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Saint>(
      where: where?.call(Saint.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SaintAttachRepository {
  const SaintAttachRepository._();

  Future<void> ecclesiasticalHierarchy(
    _i1.Session session,
    Saint saint,
    List<_i2.EcclesiasticalHierarchy> ecclesiasticalHierarchy,
  ) async {
    if (ecclesiasticalHierarchy.any((e) => e.id == null)) {
      throw ArgumentError.notNull('ecclesiasticalHierarchy.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $ecclesiasticalHierarchy = ecclesiasticalHierarchy
        .map((e) => _i2.EcclesiasticalHierarchyImplicit(
              e,
              $_saintEcclesiasticalhierarchySaintId: saint.id,
            ))
        .toList();
    await session.db.update<_i2.EcclesiasticalHierarchy>(
      $ecclesiasticalHierarchy,
      columns: [
        _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId
      ],
    );
  }

  Future<void> religiousEvents(
    _i1.Session session,
    Saint saint,
    List<_i2.ReligiousEvent> religiousEvent,
  ) async {
    if (religiousEvent.any((e) => e.id == null)) {
      throw ArgumentError.notNull('religiousEvent.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $religiousEvent = religiousEvent
        .map((e) => _i2.ReligiousEventImplicit(
              e,
              $_saintReligiouseventsSaintId: saint.id,
            ))
        .toList();
    await session.db.update<_i2.ReligiousEvent>(
      $religiousEvent,
      columns: [_i2.ReligiousEvent.t.$_saintReligiouseventsSaintId],
    );
  }

  Future<void> miracles(
    _i1.Session session,
    Saint saint,
    List<_i2.Miracle> miracle,
  ) async {
    if (miracle.any((e) => e.id == null)) {
      throw ArgumentError.notNull('miracle.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $miracle = miracle
        .map((e) => _i2.MiracleImplicit(
              e,
              $_saintMiraclesSaintId: saint.id,
            ))
        .toList();
    await session.db.update<_i2.Miracle>(
      $miracle,
      columns: [_i2.Miracle.t.$_saintMiraclesSaintId],
    );
  }

  Future<void> quotations(
    _i1.Session session,
    Saint saint,
    List<_i2.Quotation> quotation,
  ) async {
    if (quotation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $quotation = quotation
        .map((e) => _i2.QuotationImplicit(
              e,
              $_saintQuotationsSaintId: saint.id,
            ))
        .toList();
    await session.db.update<_i2.Quotation>(
      $quotation,
      columns: [_i2.Quotation.t.$_saintQuotationsSaintId],
    );
  }
}

class SaintAttachRowRepository {
  const SaintAttachRowRepository._();

  Future<void> birth(
    _i1.Session session,
    Saint saint,
    _i2.Birth birth,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }
    if (birth.id == null) {
      throw ArgumentError.notNull('birth.id');
    }

    var $saint = saint.copyWith(birthId: birth.id);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.birthId],
    );
  }

  Future<void> death(
    _i1.Session session,
    Saint saint,
    _i2.Death death,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }
    if (death.id == null) {
      throw ArgumentError.notNull('death.id');
    }

    var $saint = saint.copyWith(deathId: death.id);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.deathId],
    );
  }

  Future<void> family(
    _i1.Session session,
    Saint saint,
    _i2.Family family,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }
    if (family.id == null) {
      throw ArgumentError.notNull('family.id');
    }

    var $saint = saint.copyWith(familyId: family.id);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.familyId],
    );
  }

  Future<void> veneration(
    _i1.Session session,
    Saint saint,
    _i2.Veneration veneration,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }
    if (veneration.id == null) {
      throw ArgumentError.notNull('veneration.id');
    }

    var $saint = saint.copyWith(venerationId: veneration.id);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.venerationId],
    );
  }

  Future<void> ecclesiasticalHierarchy(
    _i1.Session session,
    Saint saint,
    _i2.EcclesiasticalHierarchy ecclesiasticalHierarchy,
  ) async {
    if (ecclesiasticalHierarchy.id == null) {
      throw ArgumentError.notNull('ecclesiasticalHierarchy.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $ecclesiasticalHierarchy = _i2.EcclesiasticalHierarchyImplicit(
      ecclesiasticalHierarchy,
      $_saintEcclesiasticalhierarchySaintId: saint.id,
    );
    await session.db.updateRow<_i2.EcclesiasticalHierarchy>(
      $ecclesiasticalHierarchy,
      columns: [
        _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId
      ],
    );
  }

  Future<void> religiousEvents(
    _i1.Session session,
    Saint saint,
    _i2.ReligiousEvent religiousEvent,
  ) async {
    if (religiousEvent.id == null) {
      throw ArgumentError.notNull('religiousEvent.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $religiousEvent = _i2.ReligiousEventImplicit(
      religiousEvent,
      $_saintReligiouseventsSaintId: saint.id,
    );
    await session.db.updateRow<_i2.ReligiousEvent>(
      $religiousEvent,
      columns: [_i2.ReligiousEvent.t.$_saintReligiouseventsSaintId],
    );
  }

  Future<void> miracles(
    _i1.Session session,
    Saint saint,
    _i2.Miracle miracle,
  ) async {
    if (miracle.id == null) {
      throw ArgumentError.notNull('miracle.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $miracle = _i2.MiracleImplicit(
      miracle,
      $_saintMiraclesSaintId: saint.id,
    );
    await session.db.updateRow<_i2.Miracle>(
      $miracle,
      columns: [_i2.Miracle.t.$_saintMiraclesSaintId],
    );
  }

  Future<void> quotations(
    _i1.Session session,
    Saint saint,
    _i2.Quotation quotation,
  ) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $quotation = _i2.QuotationImplicit(
      quotation,
      $_saintQuotationsSaintId: saint.id,
    );
    await session.db.updateRow<_i2.Quotation>(
      $quotation,
      columns: [_i2.Quotation.t.$_saintQuotationsSaintId],
    );
  }
}

class SaintDetachRepository {
  const SaintDetachRepository._();

  Future<void> ecclesiasticalHierarchy(
    _i1.Session session,
    List<_i2.EcclesiasticalHierarchy> ecclesiasticalHierarchy,
  ) async {
    if (ecclesiasticalHierarchy.any((e) => e.id == null)) {
      throw ArgumentError.notNull('ecclesiasticalHierarchy.id');
    }

    var $ecclesiasticalHierarchy = ecclesiasticalHierarchy
        .map((e) => _i2.EcclesiasticalHierarchyImplicit(
              e,
              $_saintEcclesiasticalhierarchySaintId: null,
            ))
        .toList();
    await session.db.update<_i2.EcclesiasticalHierarchy>(
      $ecclesiasticalHierarchy,
      columns: [
        _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId
      ],
    );
  }

  Future<void> religiousEvents(
    _i1.Session session,
    List<_i2.ReligiousEvent> religiousEvent,
  ) async {
    if (religiousEvent.any((e) => e.id == null)) {
      throw ArgumentError.notNull('religiousEvent.id');
    }

    var $religiousEvent = religiousEvent
        .map((e) => _i2.ReligiousEventImplicit(
              e,
              $_saintReligiouseventsSaintId: null,
            ))
        .toList();
    await session.db.update<_i2.ReligiousEvent>(
      $religiousEvent,
      columns: [_i2.ReligiousEvent.t.$_saintReligiouseventsSaintId],
    );
  }

  Future<void> miracles(
    _i1.Session session,
    List<_i2.Miracle> miracle,
  ) async {
    if (miracle.any((e) => e.id == null)) {
      throw ArgumentError.notNull('miracle.id');
    }

    var $miracle = miracle
        .map((e) => _i2.MiracleImplicit(
              e,
              $_saintMiraclesSaintId: null,
            ))
        .toList();
    await session.db.update<_i2.Miracle>(
      $miracle,
      columns: [_i2.Miracle.t.$_saintMiraclesSaintId],
    );
  }

  Future<void> quotations(
    _i1.Session session,
    List<_i2.Quotation> quotation,
  ) async {
    if (quotation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quotation.id');
    }

    var $quotation = quotation
        .map((e) => _i2.QuotationImplicit(
              e,
              $_saintQuotationsSaintId: null,
            ))
        .toList();
    await session.db.update<_i2.Quotation>(
      $quotation,
      columns: [_i2.Quotation.t.$_saintQuotationsSaintId],
    );
  }
}

class SaintDetachRowRepository {
  const SaintDetachRowRepository._();

  Future<void> birth(
    _i1.Session session,
    Saint saint,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $saint = saint.copyWith(birthId: null);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.birthId],
    );
  }

  Future<void> death(
    _i1.Session session,
    Saint saint,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $saint = saint.copyWith(deathId: null);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.deathId],
    );
  }

  Future<void> family(
    _i1.Session session,
    Saint saint,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $saint = saint.copyWith(familyId: null);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.familyId],
    );
  }

  Future<void> veneration(
    _i1.Session session,
    Saint saint,
  ) async {
    if (saint.id == null) {
      throw ArgumentError.notNull('saint.id');
    }

    var $saint = saint.copyWith(venerationId: null);
    await session.db.updateRow<Saint>(
      $saint,
      columns: [Saint.t.venerationId],
    );
  }

  Future<void> ecclesiasticalHierarchy(
    _i1.Session session,
    _i2.EcclesiasticalHierarchy ecclesiasticalHierarchy,
  ) async {
    if (ecclesiasticalHierarchy.id == null) {
      throw ArgumentError.notNull('ecclesiasticalHierarchy.id');
    }

    var $ecclesiasticalHierarchy = _i2.EcclesiasticalHierarchyImplicit(
      ecclesiasticalHierarchy,
      $_saintEcclesiasticalhierarchySaintId: null,
    );
    await session.db.updateRow<_i2.EcclesiasticalHierarchy>(
      $ecclesiasticalHierarchy,
      columns: [
        _i2.EcclesiasticalHierarchy.t.$_saintEcclesiasticalhierarchySaintId
      ],
    );
  }

  Future<void> religiousEvents(
    _i1.Session session,
    _i2.ReligiousEvent religiousEvent,
  ) async {
    if (religiousEvent.id == null) {
      throw ArgumentError.notNull('religiousEvent.id');
    }

    var $religiousEvent = _i2.ReligiousEventImplicit(
      religiousEvent,
      $_saintReligiouseventsSaintId: null,
    );
    await session.db.updateRow<_i2.ReligiousEvent>(
      $religiousEvent,
      columns: [_i2.ReligiousEvent.t.$_saintReligiouseventsSaintId],
    );
  }

  Future<void> miracles(
    _i1.Session session,
    _i2.Miracle miracle,
  ) async {
    if (miracle.id == null) {
      throw ArgumentError.notNull('miracle.id');
    }

    var $miracle = _i2.MiracleImplicit(
      miracle,
      $_saintMiraclesSaintId: null,
    );
    await session.db.updateRow<_i2.Miracle>(
      $miracle,
      columns: [_i2.Miracle.t.$_saintMiraclesSaintId],
    );
  }

  Future<void> quotations(
    _i1.Session session,
    _i2.Quotation quotation,
  ) async {
    if (quotation.id == null) {
      throw ArgumentError.notNull('quotation.id');
    }

    var $quotation = _i2.QuotationImplicit(
      quotation,
      $_saintQuotationsSaintId: null,
    );
    await session.db.updateRow<_i2.Quotation>(
      $quotation,
      columns: [_i2.Quotation.t.$_saintQuotationsSaintId],
    );
  }
}
