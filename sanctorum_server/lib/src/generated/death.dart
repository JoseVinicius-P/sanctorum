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

abstract class Death extends _i1.TableRow implements _i1.ProtocolSerialization {
  Death._({
    int? id,
    this.period,
    this.country,
    this.city,
    this.details,
    this.correspondentActualCountry,
    this.isMartir,
    this.causeOfdeath,
  }) : super(id);

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

  static final t = DeathTable();

  static const db = DeathRepository._();

  List<_i2.Date>? period;

  String? country;

  String? city;

  String? details;

  String? correspondentActualCountry;

  bool? isMartir;

  String? causeOfdeath;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (period != null)
        'period': period?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (details != null) 'details': details,
      if (correspondentActualCountry != null)
        'correspondentActualCountry': correspondentActualCountry,
      if (isMartir != null) 'isMartir': isMartir,
      if (causeOfdeath != null) 'causeOfdeath': causeOfdeath,
    };
  }

  static DeathInclude include() {
    return DeathInclude._();
  }

  static DeathIncludeList includeList({
    _i1.WhereExpressionBuilder<DeathTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeathTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeathTable>? orderByList,
    DeathInclude? include,
  }) {
    return DeathIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Death.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Death.t),
      include: include,
    );
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

class DeathTable extends _i1.Table {
  DeathTable({super.tableRelation}) : super(tableName: 'death') {
    period = _i1.ColumnSerializable(
      'period',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    details = _i1.ColumnString(
      'details',
      this,
    );
    correspondentActualCountry = _i1.ColumnString(
      'correspondentActualCountry',
      this,
    );
    isMartir = _i1.ColumnBool(
      'isMartir',
      this,
    );
    causeOfdeath = _i1.ColumnString(
      'causeOfdeath',
      this,
    );
  }

  late final _i1.ColumnSerializable period;

  late final _i1.ColumnString country;

  late final _i1.ColumnString city;

  late final _i1.ColumnString details;

  late final _i1.ColumnString correspondentActualCountry;

  late final _i1.ColumnBool isMartir;

  late final _i1.ColumnString causeOfdeath;

  @override
  List<_i1.Column> get columns => [
        id,
        period,
        country,
        city,
        details,
        correspondentActualCountry,
        isMartir,
        causeOfdeath,
      ];
}

class DeathInclude extends _i1.IncludeObject {
  DeathInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Death.t;
}

class DeathIncludeList extends _i1.IncludeList {
  DeathIncludeList._({
    _i1.WhereExpressionBuilder<DeathTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Death.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Death.t;
}

class DeathRepository {
  const DeathRepository._();

  Future<List<Death>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeathTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeathTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeathTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Death>(
      where: where?.call(Death.t),
      orderBy: orderBy?.call(Death.t),
      orderByList: orderByList?.call(Death.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Death?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeathTable>? where,
    int? offset,
    _i1.OrderByBuilder<DeathTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeathTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Death>(
      where: where?.call(Death.t),
      orderBy: orderBy?.call(Death.t),
      orderByList: orderByList?.call(Death.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Death?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Death>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Death>> insert(
    _i1.Session session,
    List<Death> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Death>(
      rows,
      transaction: transaction,
    );
  }

  Future<Death> insertRow(
    _i1.Session session,
    Death row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Death>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Death>> update(
    _i1.Session session,
    List<Death> rows, {
    _i1.ColumnSelections<DeathTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Death>(
      rows,
      columns: columns?.call(Death.t),
      transaction: transaction,
    );
  }

  Future<Death> updateRow(
    _i1.Session session,
    Death row, {
    _i1.ColumnSelections<DeathTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Death>(
      row,
      columns: columns?.call(Death.t),
      transaction: transaction,
    );
  }

  Future<List<Death>> delete(
    _i1.Session session,
    List<Death> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Death>(
      rows,
      transaction: transaction,
    );
  }

  Future<Death> deleteRow(
    _i1.Session session,
    Death row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Death>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Death>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DeathTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Death>(
      where: where(Death.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeathTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Death>(
      where: where?.call(Death.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
