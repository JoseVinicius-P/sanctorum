/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Date extends _i1.TableRow implements _i1.ProtocolSerialization {
  Date._({
    int? id,
    required this.year,
    required this.month,
    required this.day,
  }) : super(id);

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

  static final t = DateTable();

  static const db = DateRepository._();

  int year;

  int month;

  int day;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'year': year,
      'month': month,
      'day': day,
    };
  }

  static DateInclude include() {
    return DateInclude._();
  }

  static DateIncludeList includeList({
    _i1.WhereExpressionBuilder<DateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DateTable>? orderByList,
    DateInclude? include,
  }) {
    return DateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Date.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Date.t),
      include: include,
    );
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

class DateTable extends _i1.Table {
  DateTable({super.tableRelation}) : super(tableName: 'date') {
    year = _i1.ColumnInt(
      'year',
      this,
    );
    month = _i1.ColumnInt(
      'month',
      this,
    );
    day = _i1.ColumnInt(
      'day',
      this,
    );
  }

  late final _i1.ColumnInt year;

  late final _i1.ColumnInt month;

  late final _i1.ColumnInt day;

  @override
  List<_i1.Column> get columns => [
        id,
        year,
        month,
        day,
      ];
}

class DateInclude extends _i1.IncludeObject {
  DateInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Date.t;
}

class DateIncludeList extends _i1.IncludeList {
  DateIncludeList._({
    _i1.WhereExpressionBuilder<DateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Date.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Date.t;
}

class DateRepository {
  const DateRepository._();

  Future<List<Date>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Date>(
      where: where?.call(Date.t),
      orderBy: orderBy?.call(Date.t),
      orderByList: orderByList?.call(Date.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Date?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DateTable>? where,
    int? offset,
    _i1.OrderByBuilder<DateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Date>(
      where: where?.call(Date.t),
      orderBy: orderBy?.call(Date.t),
      orderByList: orderByList?.call(Date.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Date?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Date>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Date>> insert(
    _i1.Session session,
    List<Date> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Date>(
      rows,
      transaction: transaction,
    );
  }

  Future<Date> insertRow(
    _i1.Session session,
    Date row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Date>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Date>> update(
    _i1.Session session,
    List<Date> rows, {
    _i1.ColumnSelections<DateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Date>(
      rows,
      columns: columns?.call(Date.t),
      transaction: transaction,
    );
  }

  Future<Date> updateRow(
    _i1.Session session,
    Date row, {
    _i1.ColumnSelections<DateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Date>(
      row,
      columns: columns?.call(Date.t),
      transaction: transaction,
    );
  }

  Future<List<Date>> delete(
    _i1.Session session,
    List<Date> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Date>(
      rows,
      transaction: transaction,
    );
  }

  Future<Date> deleteRow(
    _i1.Session session,
    Date row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Date>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Date>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DateTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Date>(
      where: where(Date.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Date>(
      where: where?.call(Date.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
