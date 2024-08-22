/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ReligiousEvent extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  ReligiousEvent._({
    int? id,
    this.year,
    this.event,
  }) : super(id);

  factory ReligiousEvent({
    int? id,
    int? year,
    String? event,
  }) = _ReligiousEventImpl;

  factory ReligiousEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReligiousEvent(
      id: jsonSerialization['id'] as int?,
      year: jsonSerialization['year'] as int?,
      event: jsonSerialization['event'] as String?,
    );
  }

  static final t = ReligiousEventTable();

  static const db = ReligiousEventRepository._();

  int? year;

  String? event;

  int? _saintReligiouseventsSaintId;

  @override
  _i1.Table get table => t;

  ReligiousEvent copyWith({
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
      if (_saintReligiouseventsSaintId != null)
        '_saintReligiouseventsSaintId': _saintReligiouseventsSaintId,
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

  static ReligiousEventInclude include() {
    return ReligiousEventInclude._();
  }

  static ReligiousEventIncludeList includeList({
    _i1.WhereExpressionBuilder<ReligiousEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReligiousEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReligiousEventTable>? orderByList,
    ReligiousEventInclude? include,
  }) {
    return ReligiousEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReligiousEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ReligiousEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReligiousEventImpl extends ReligiousEvent {
  _ReligiousEventImpl({
    int? id,
    int? year,
    String? event,
  }) : super._(
          id: id,
          year: year,
          event: event,
        );

  @override
  ReligiousEvent copyWith({
    Object? id = _Undefined,
    Object? year = _Undefined,
    Object? event = _Undefined,
  }) {
    return ReligiousEvent(
      id: id is int? ? id : this.id,
      year: year is int? ? year : this.year,
      event: event is String? ? event : this.event,
    );
  }
}

class ReligiousEventImplicit extends _ReligiousEventImpl {
  ReligiousEventImplicit._({
    int? id,
    int? year,
    String? event,
    this.$_saintReligiouseventsSaintId,
  }) : super(
          id: id,
          year: year,
          event: event,
        );

  factory ReligiousEventImplicit(
    ReligiousEvent religiousEvent, {
    int? $_saintReligiouseventsSaintId,
  }) {
    return ReligiousEventImplicit._(
      id: religiousEvent.id,
      year: religiousEvent.year,
      event: religiousEvent.event,
      $_saintReligiouseventsSaintId: $_saintReligiouseventsSaintId,
    );
  }

  int? $_saintReligiouseventsSaintId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll(
        {'_saintReligiouseventsSaintId': $_saintReligiouseventsSaintId});
    return jsonMap;
  }
}

class ReligiousEventTable extends _i1.Table {
  ReligiousEventTable({super.tableRelation})
      : super(tableName: 'religious_event') {
    year = _i1.ColumnInt(
      'year',
      this,
    );
    event = _i1.ColumnString(
      'event',
      this,
    );
    $_saintReligiouseventsSaintId = _i1.ColumnInt(
      '_saintReligiouseventsSaintId',
      this,
    );
  }

  late final _i1.ColumnInt year;

  late final _i1.ColumnString event;

  late final _i1.ColumnInt $_saintReligiouseventsSaintId;

  @override
  List<_i1.Column> get columns => [
        id,
        year,
        event,
        $_saintReligiouseventsSaintId,
      ];
}

class ReligiousEventInclude extends _i1.IncludeObject {
  ReligiousEventInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ReligiousEvent.t;
}

class ReligiousEventIncludeList extends _i1.IncludeList {
  ReligiousEventIncludeList._({
    _i1.WhereExpressionBuilder<ReligiousEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReligiousEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ReligiousEvent.t;
}

class ReligiousEventRepository {
  const ReligiousEventRepository._();

  Future<List<ReligiousEvent>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReligiousEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReligiousEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReligiousEventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ReligiousEvent>(
      where: where?.call(ReligiousEvent.t),
      orderBy: orderBy?.call(ReligiousEvent.t),
      orderByList: orderByList?.call(ReligiousEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ReligiousEvent?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReligiousEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReligiousEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReligiousEventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ReligiousEvent>(
      where: where?.call(ReligiousEvent.t),
      orderBy: orderBy?.call(ReligiousEvent.t),
      orderByList: orderByList?.call(ReligiousEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ReligiousEvent?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ReligiousEvent>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ReligiousEvent>> insert(
    _i1.Session session,
    List<ReligiousEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ReligiousEvent>(
      rows,
      transaction: transaction,
    );
  }

  Future<ReligiousEvent> insertRow(
    _i1.Session session,
    ReligiousEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReligiousEvent>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ReligiousEvent>> update(
    _i1.Session session,
    List<ReligiousEvent> rows, {
    _i1.ColumnSelections<ReligiousEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ReligiousEvent>(
      rows,
      columns: columns?.call(ReligiousEvent.t),
      transaction: transaction,
    );
  }

  Future<ReligiousEvent> updateRow(
    _i1.Session session,
    ReligiousEvent row, {
    _i1.ColumnSelections<ReligiousEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReligiousEvent>(
      row,
      columns: columns?.call(ReligiousEvent.t),
      transaction: transaction,
    );
  }

  Future<List<ReligiousEvent>> delete(
    _i1.Session session,
    List<ReligiousEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ReligiousEvent>(
      rows,
      transaction: transaction,
    );
  }

  Future<ReligiousEvent> deleteRow(
    _i1.Session session,
    ReligiousEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReligiousEvent>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ReligiousEvent>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ReligiousEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ReligiousEvent>(
      where: where(ReligiousEvent.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReligiousEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReligiousEvent>(
      where: where?.call(ReligiousEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
