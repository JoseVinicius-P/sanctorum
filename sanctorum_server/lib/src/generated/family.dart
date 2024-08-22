/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Family extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Family._({
    int? id,
    this.mother,
    this.father,
    this.numberOfSiblings,
  }) : super(id);

  factory Family({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  }) = _FamilyImpl;

  factory Family.fromJson(Map<String, dynamic> jsonSerialization) {
    return Family(
      id: jsonSerialization['id'] as int?,
      mother: jsonSerialization['mother'] as String?,
      father: jsonSerialization['father'] as String?,
      numberOfSiblings: jsonSerialization['numberOfSiblings'] as int?,
    );
  }

  static final t = FamilyTable();

  static const db = FamilyRepository._();

  String? mother;

  String? father;

  int? numberOfSiblings;

  @override
  _i1.Table get table => t;

  Family copyWith({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (mother != null) 'mother': mother,
      if (father != null) 'father': father,
      if (numberOfSiblings != null) 'numberOfSiblings': numberOfSiblings,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (mother != null) 'mother': mother,
      if (father != null) 'father': father,
      if (numberOfSiblings != null) 'numberOfSiblings': numberOfSiblings,
    };
  }

  static FamilyInclude include() {
    return FamilyInclude._();
  }

  static FamilyIncludeList includeList({
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    FamilyInclude? include,
  }) {
    return FamilyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Family.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Family.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FamilyImpl extends Family {
  _FamilyImpl({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  }) : super._(
          id: id,
          mother: mother,
          father: father,
          numberOfSiblings: numberOfSiblings,
        );

  @override
  Family copyWith({
    Object? id = _Undefined,
    Object? mother = _Undefined,
    Object? father = _Undefined,
    Object? numberOfSiblings = _Undefined,
  }) {
    return Family(
      id: id is int? ? id : this.id,
      mother: mother is String? ? mother : this.mother,
      father: father is String? ? father : this.father,
      numberOfSiblings:
          numberOfSiblings is int? ? numberOfSiblings : this.numberOfSiblings,
    );
  }
}

class FamilyTable extends _i1.Table {
  FamilyTable({super.tableRelation}) : super(tableName: 'family') {
    mother = _i1.ColumnString(
      'mother',
      this,
    );
    father = _i1.ColumnString(
      'father',
      this,
    );
    numberOfSiblings = _i1.ColumnInt(
      'numberOfSiblings',
      this,
    );
  }

  late final _i1.ColumnString mother;

  late final _i1.ColumnString father;

  late final _i1.ColumnInt numberOfSiblings;

  @override
  List<_i1.Column> get columns => [
        id,
        mother,
        father,
        numberOfSiblings,
      ];
}

class FamilyInclude extends _i1.IncludeObject {
  FamilyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Family.t;
}

class FamilyIncludeList extends _i1.IncludeList {
  FamilyIncludeList._({
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Family.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Family.t;
}

class FamilyRepository {
  const FamilyRepository._();

  Future<List<Family>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Family>(
      where: where?.call(Family.t),
      orderBy: orderBy?.call(Family.t),
      orderByList: orderByList?.call(Family.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Family?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? offset,
    _i1.OrderByBuilder<FamilyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FamilyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Family>(
      where: where?.call(Family.t),
      orderBy: orderBy?.call(Family.t),
      orderByList: orderByList?.call(Family.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Family?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Family>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Family>> insert(
    _i1.Session session,
    List<Family> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Family>(
      rows,
      transaction: transaction,
    );
  }

  Future<Family> insertRow(
    _i1.Session session,
    Family row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Family>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Family>> update(
    _i1.Session session,
    List<Family> rows, {
    _i1.ColumnSelections<FamilyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Family>(
      rows,
      columns: columns?.call(Family.t),
      transaction: transaction,
    );
  }

  Future<Family> updateRow(
    _i1.Session session,
    Family row, {
    _i1.ColumnSelections<FamilyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Family>(
      row,
      columns: columns?.call(Family.t),
      transaction: transaction,
    );
  }

  Future<List<Family>> delete(
    _i1.Session session,
    List<Family> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Family>(
      rows,
      transaction: transaction,
    );
  }

  Future<Family> deleteRow(
    _i1.Session session,
    Family row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Family>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Family>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FamilyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Family>(
      where: where(Family.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FamilyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Family>(
      where: where?.call(Family.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
