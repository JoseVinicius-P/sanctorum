/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Veneration extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Veneration._({
    int? id,
    this.celebrationDate,
    this.legacy,
  }) : super(id);

  factory Veneration({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  }) = _VenerationImpl;

  factory Veneration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Veneration(
      id: jsonSerialization['id'] as int?,
      celebrationDate: (jsonSerialization['celebrationDate'] as List?)
          ?.map((e) => e as String)
          .toList(),
      legacy: jsonSerialization['legacy'] as String?,
    );
  }

  static final t = VenerationTable();

  static const db = VenerationRepository._();

  List<String>? celebrationDate;

  String? legacy;

  @override
  _i1.Table get table => t;

  Veneration copyWith({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (celebrationDate != null) 'celebrationDate': celebrationDate?.toJson(),
      if (legacy != null) 'legacy': legacy,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (celebrationDate != null) 'celebrationDate': celebrationDate?.toJson(),
      if (legacy != null) 'legacy': legacy,
    };
  }

  static VenerationInclude include() {
    return VenerationInclude._();
  }

  static VenerationIncludeList includeList({
    _i1.WhereExpressionBuilder<VenerationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VenerationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VenerationTable>? orderByList,
    VenerationInclude? include,
  }) {
    return VenerationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Veneration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Veneration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VenerationImpl extends Veneration {
  _VenerationImpl({
    int? id,
    List<String>? celebrationDate,
    String? legacy,
  }) : super._(
          id: id,
          celebrationDate: celebrationDate,
          legacy: legacy,
        );

  @override
  Veneration copyWith({
    Object? id = _Undefined,
    Object? celebrationDate = _Undefined,
    Object? legacy = _Undefined,
  }) {
    return Veneration(
      id: id is int? ? id : this.id,
      celebrationDate: celebrationDate is List<String>?
          ? celebrationDate
          : this.celebrationDate?.clone(),
      legacy: legacy is String? ? legacy : this.legacy,
    );
  }
}

class VenerationTable extends _i1.Table {
  VenerationTable({super.tableRelation}) : super(tableName: 'veneration') {
    celebrationDate = _i1.ColumnSerializable(
      'celebrationDate',
      this,
    );
    legacy = _i1.ColumnString(
      'legacy',
      this,
    );
  }

  late final _i1.ColumnSerializable celebrationDate;

  late final _i1.ColumnString legacy;

  @override
  List<_i1.Column> get columns => [
        id,
        celebrationDate,
        legacy,
      ];
}

class VenerationInclude extends _i1.IncludeObject {
  VenerationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Veneration.t;
}

class VenerationIncludeList extends _i1.IncludeList {
  VenerationIncludeList._({
    _i1.WhereExpressionBuilder<VenerationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Veneration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Veneration.t;
}

class VenerationRepository {
  const VenerationRepository._();

  Future<List<Veneration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VenerationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VenerationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VenerationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Veneration>(
      where: where?.call(Veneration.t),
      orderBy: orderBy?.call(Veneration.t),
      orderByList: orderByList?.call(Veneration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Veneration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VenerationTable>? where,
    int? offset,
    _i1.OrderByBuilder<VenerationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VenerationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Veneration>(
      where: where?.call(Veneration.t),
      orderBy: orderBy?.call(Veneration.t),
      orderByList: orderByList?.call(Veneration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Veneration?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Veneration>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Veneration>> insert(
    _i1.Session session,
    List<Veneration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Veneration>(
      rows,
      transaction: transaction,
    );
  }

  Future<Veneration> insertRow(
    _i1.Session session,
    Veneration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Veneration>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Veneration>> update(
    _i1.Session session,
    List<Veneration> rows, {
    _i1.ColumnSelections<VenerationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Veneration>(
      rows,
      columns: columns?.call(Veneration.t),
      transaction: transaction,
    );
  }

  Future<Veneration> updateRow(
    _i1.Session session,
    Veneration row, {
    _i1.ColumnSelections<VenerationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Veneration>(
      row,
      columns: columns?.call(Veneration.t),
      transaction: transaction,
    );
  }

  Future<List<Veneration>> delete(
    _i1.Session session,
    List<Veneration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Veneration>(
      rows,
      transaction: transaction,
    );
  }

  Future<Veneration> deleteRow(
    _i1.Session session,
    Veneration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Veneration>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Veneration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VenerationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Veneration>(
      where: where(Veneration.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VenerationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Veneration>(
      where: where?.call(Veneration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
