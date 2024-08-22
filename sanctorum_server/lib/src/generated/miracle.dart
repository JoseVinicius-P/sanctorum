/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Miracle extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Miracle._({
    int? id,
    this.year,
    this.event,
  }) : super(id);

  factory Miracle({
    int? id,
    int? year,
    String? event,
  }) = _MiracleImpl;

  factory Miracle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Miracle(
      id: jsonSerialization['id'] as int?,
      year: jsonSerialization['year'] as int?,
      event: jsonSerialization['event'] as String?,
    );
  }

  static final t = MiracleTable();

  static const db = MiracleRepository._();

  int? year;

  String? event;

  int? _saintMiraclesSaintId;

  @override
  _i1.Table get table => t;

  Miracle copyWith({
    int? id,
    int? year,
    String? event,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (event != null) 'event': event,
      if (_saintMiraclesSaintId != null)
        '_saintMiraclesSaintId': _saintMiraclesSaintId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (event != null) 'event': event,
    };
  }

  static MiracleInclude include() {
    return MiracleInclude._();
  }

  static MiracleIncludeList includeList({
    _i1.WhereExpressionBuilder<MiracleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MiracleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MiracleTable>? orderByList,
    MiracleInclude? include,
  }) {
    return MiracleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Miracle.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Miracle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MiracleImpl extends Miracle {
  _MiracleImpl({
    int? id,
    int? year,
    String? event,
  }) : super._(
          id: id,
          year: year,
          event: event,
        );

  @override
  Miracle copyWith({
    Object? id = _Undefined,
    Object? year = _Undefined,
    Object? event = _Undefined,
  }) {
    return Miracle(
      id: id is int? ? id : this.id,
      year: year is int? ? year : this.year,
      event: event is String? ? event : this.event,
    );
  }
}

class MiracleImplicit extends _MiracleImpl {
  MiracleImplicit._({
    int? id,
    int? year,
    String? event,
    this.$_saintMiraclesSaintId,
  }) : super(
          id: id,
          year: year,
          event: event,
        );

  factory MiracleImplicit(
    Miracle miracle, {
    int? $_saintMiraclesSaintId,
  }) {
    return MiracleImplicit._(
      id: miracle.id,
      year: miracle.year,
      event: miracle.event,
      $_saintMiraclesSaintId: $_saintMiraclesSaintId,
    );
  }

  int? $_saintMiraclesSaintId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_saintMiraclesSaintId': $_saintMiraclesSaintId});
    return jsonMap;
  }
}

class MiracleTable extends _i1.Table {
  MiracleTable({super.tableRelation}) : super(tableName: 'miracle') {
    year = _i1.ColumnInt(
      'year',
      this,
    );
    event = _i1.ColumnString(
      'event',
      this,
    );
    $_saintMiraclesSaintId = _i1.ColumnInt(
      '_saintMiraclesSaintId',
      this,
    );
  }

  late final _i1.ColumnInt year;

  late final _i1.ColumnString event;

  late final _i1.ColumnInt $_saintMiraclesSaintId;

  @override
  List<_i1.Column> get columns => [
        id,
        year,
        event,
        $_saintMiraclesSaintId,
      ];
}

class MiracleInclude extends _i1.IncludeObject {
  MiracleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Miracle.t;
}

class MiracleIncludeList extends _i1.IncludeList {
  MiracleIncludeList._({
    _i1.WhereExpressionBuilder<MiracleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Miracle.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Miracle.t;
}

class MiracleRepository {
  const MiracleRepository._();

  Future<List<Miracle>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MiracleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MiracleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MiracleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Miracle>(
      where: where?.call(Miracle.t),
      orderBy: orderBy?.call(Miracle.t),
      orderByList: orderByList?.call(Miracle.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Miracle?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MiracleTable>? where,
    int? offset,
    _i1.OrderByBuilder<MiracleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MiracleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Miracle>(
      where: where?.call(Miracle.t),
      orderBy: orderBy?.call(Miracle.t),
      orderByList: orderByList?.call(Miracle.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Miracle?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Miracle>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Miracle>> insert(
    _i1.Session session,
    List<Miracle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Miracle>(
      rows,
      transaction: transaction,
    );
  }

  Future<Miracle> insertRow(
    _i1.Session session,
    Miracle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Miracle>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Miracle>> update(
    _i1.Session session,
    List<Miracle> rows, {
    _i1.ColumnSelections<MiracleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Miracle>(
      rows,
      columns: columns?.call(Miracle.t),
      transaction: transaction,
    );
  }

  Future<Miracle> updateRow(
    _i1.Session session,
    Miracle row, {
    _i1.ColumnSelections<MiracleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Miracle>(
      row,
      columns: columns?.call(Miracle.t),
      transaction: transaction,
    );
  }

  Future<List<Miracle>> delete(
    _i1.Session session,
    List<Miracle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Miracle>(
      rows,
      transaction: transaction,
    );
  }

  Future<Miracle> deleteRow(
    _i1.Session session,
    Miracle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Miracle>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Miracle>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MiracleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Miracle>(
      where: where(Miracle.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MiracleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Miracle>(
      where: where?.call(Miracle.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
