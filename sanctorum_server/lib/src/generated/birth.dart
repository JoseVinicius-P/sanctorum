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

abstract class Birth extends _i1.TableRow implements _i1.ProtocolSerialization {
  Birth._({
    int? id,
    this.period,
    this.country,
    this.city,
    this.details,
    this.correspondentActualCountry,
  }) : super(id);

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

  static final t = BirthTable();

  static const db = BirthRepository._();

  List<_i2.Date>? period;

  String? country;

  String? city;

  String? details;

  String? correspondentActualCountry;

  @override
  _i1.Table get table => t;

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
    };
  }

  static BirthInclude include() {
    return BirthInclude._();
  }

  static BirthIncludeList includeList({
    _i1.WhereExpressionBuilder<BirthTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BirthTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BirthTable>? orderByList,
    BirthInclude? include,
  }) {
    return BirthIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Birth.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Birth.t),
      include: include,
    );
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

class BirthTable extends _i1.Table {
  BirthTable({super.tableRelation}) : super(tableName: 'birth') {
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
  }

  late final _i1.ColumnSerializable period;

  late final _i1.ColumnString country;

  late final _i1.ColumnString city;

  late final _i1.ColumnString details;

  late final _i1.ColumnString correspondentActualCountry;

  @override
  List<_i1.Column> get columns => [
        id,
        period,
        country,
        city,
        details,
        correspondentActualCountry,
      ];
}

class BirthInclude extends _i1.IncludeObject {
  BirthInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Birth.t;
}

class BirthIncludeList extends _i1.IncludeList {
  BirthIncludeList._({
    _i1.WhereExpressionBuilder<BirthTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Birth.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Birth.t;
}

class BirthRepository {
  const BirthRepository._();

  Future<List<Birth>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BirthTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BirthTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BirthTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Birth>(
      where: where?.call(Birth.t),
      orderBy: orderBy?.call(Birth.t),
      orderByList: orderByList?.call(Birth.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Birth?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BirthTable>? where,
    int? offset,
    _i1.OrderByBuilder<BirthTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BirthTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Birth>(
      where: where?.call(Birth.t),
      orderBy: orderBy?.call(Birth.t),
      orderByList: orderByList?.call(Birth.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Birth?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Birth>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Birth>> insert(
    _i1.Session session,
    List<Birth> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Birth>(
      rows,
      transaction: transaction,
    );
  }

  Future<Birth> insertRow(
    _i1.Session session,
    Birth row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Birth>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Birth>> update(
    _i1.Session session,
    List<Birth> rows, {
    _i1.ColumnSelections<BirthTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Birth>(
      rows,
      columns: columns?.call(Birth.t),
      transaction: transaction,
    );
  }

  Future<Birth> updateRow(
    _i1.Session session,
    Birth row, {
    _i1.ColumnSelections<BirthTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Birth>(
      row,
      columns: columns?.call(Birth.t),
      transaction: transaction,
    );
  }

  Future<List<Birth>> delete(
    _i1.Session session,
    List<Birth> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Birth>(
      rows,
      transaction: transaction,
    );
  }

  Future<Birth> deleteRow(
    _i1.Session session,
    Birth row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Birth>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Birth>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BirthTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Birth>(
      where: where(Birth.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BirthTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Birth>(
      where: where?.call(Birth.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
