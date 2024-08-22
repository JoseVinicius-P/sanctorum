/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class EcclesiasticalHierarchy extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  EcclesiasticalHierarchy._({
    int? id,
    this.mother,
    this.father,
    this.numberOfSiblings,
  }) : super(id);

  factory EcclesiasticalHierarchy({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
  }) = _EcclesiasticalHierarchyImpl;

  factory EcclesiasticalHierarchy.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return EcclesiasticalHierarchy(
      id: jsonSerialization['id'] as int?,
      mother: jsonSerialization['mother'] as String?,
      father: jsonSerialization['father'] as String?,
      numberOfSiblings: jsonSerialization['numberOfSiblings'] as int?,
    );
  }

  static final t = EcclesiasticalHierarchyTable();

  static const db = EcclesiasticalHierarchyRepository._();

  String? mother;

  String? father;

  int? numberOfSiblings;

  int? _saintEcclesiasticalhierarchySaintId;

  @override
  _i1.Table get table => t;

  EcclesiasticalHierarchy copyWith({
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
      if (_saintEcclesiasticalhierarchySaintId != null)
        '_saintEcclesiasticalhierarchySaintId':
            _saintEcclesiasticalhierarchySaintId,
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

  static EcclesiasticalHierarchyInclude include() {
    return EcclesiasticalHierarchyInclude._();
  }

  static EcclesiasticalHierarchyIncludeList includeList({
    _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EcclesiasticalHierarchyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EcclesiasticalHierarchyTable>? orderByList,
    EcclesiasticalHierarchyInclude? include,
  }) {
    return EcclesiasticalHierarchyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EcclesiasticalHierarchy.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EcclesiasticalHierarchy.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EcclesiasticalHierarchyImpl extends EcclesiasticalHierarchy {
  _EcclesiasticalHierarchyImpl({
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
  EcclesiasticalHierarchy copyWith({
    Object? id = _Undefined,
    Object? mother = _Undefined,
    Object? father = _Undefined,
    Object? numberOfSiblings = _Undefined,
  }) {
    return EcclesiasticalHierarchy(
      id: id is int? ? id : this.id,
      mother: mother is String? ? mother : this.mother,
      father: father is String? ? father : this.father,
      numberOfSiblings:
          numberOfSiblings is int? ? numberOfSiblings : this.numberOfSiblings,
    );
  }
}

class EcclesiasticalHierarchyImplicit extends _EcclesiasticalHierarchyImpl {
  EcclesiasticalHierarchyImplicit._({
    int? id,
    String? mother,
    String? father,
    int? numberOfSiblings,
    this.$_saintEcclesiasticalhierarchySaintId,
  }) : super(
          id: id,
          mother: mother,
          father: father,
          numberOfSiblings: numberOfSiblings,
        );

  factory EcclesiasticalHierarchyImplicit(
    EcclesiasticalHierarchy ecclesiasticalHierarchy, {
    int? $_saintEcclesiasticalhierarchySaintId,
  }) {
    return EcclesiasticalHierarchyImplicit._(
      id: ecclesiasticalHierarchy.id,
      mother: ecclesiasticalHierarchy.mother,
      father: ecclesiasticalHierarchy.father,
      numberOfSiblings: ecclesiasticalHierarchy.numberOfSiblings,
      $_saintEcclesiasticalhierarchySaintId:
          $_saintEcclesiasticalhierarchySaintId,
    );
  }

  int? $_saintEcclesiasticalhierarchySaintId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({
      '_saintEcclesiasticalhierarchySaintId':
          $_saintEcclesiasticalhierarchySaintId
    });
    return jsonMap;
  }
}

class EcclesiasticalHierarchyTable extends _i1.Table {
  EcclesiasticalHierarchyTable({super.tableRelation})
      : super(tableName: 'ecclesiastical_hierarchy') {
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
    $_saintEcclesiasticalhierarchySaintId = _i1.ColumnInt(
      '_saintEcclesiasticalhierarchySaintId',
      this,
    );
  }

  late final _i1.ColumnString mother;

  late final _i1.ColumnString father;

  late final _i1.ColumnInt numberOfSiblings;

  late final _i1.ColumnInt $_saintEcclesiasticalhierarchySaintId;

  @override
  List<_i1.Column> get columns => [
        id,
        mother,
        father,
        numberOfSiblings,
        $_saintEcclesiasticalhierarchySaintId,
      ];
}

class EcclesiasticalHierarchyInclude extends _i1.IncludeObject {
  EcclesiasticalHierarchyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => EcclesiasticalHierarchy.t;
}

class EcclesiasticalHierarchyIncludeList extends _i1.IncludeList {
  EcclesiasticalHierarchyIncludeList._({
    _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EcclesiasticalHierarchy.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => EcclesiasticalHierarchy.t;
}

class EcclesiasticalHierarchyRepository {
  const EcclesiasticalHierarchyRepository._();

  Future<List<EcclesiasticalHierarchy>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EcclesiasticalHierarchyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EcclesiasticalHierarchyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EcclesiasticalHierarchy>(
      where: where?.call(EcclesiasticalHierarchy.t),
      orderBy: orderBy?.call(EcclesiasticalHierarchy.t),
      orderByList: orderByList?.call(EcclesiasticalHierarchy.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<EcclesiasticalHierarchy?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable>? where,
    int? offset,
    _i1.OrderByBuilder<EcclesiasticalHierarchyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EcclesiasticalHierarchyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EcclesiasticalHierarchy>(
      where: where?.call(EcclesiasticalHierarchy.t),
      orderBy: orderBy?.call(EcclesiasticalHierarchy.t),
      orderByList: orderByList?.call(EcclesiasticalHierarchy.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<EcclesiasticalHierarchy?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EcclesiasticalHierarchy>(
      id,
      transaction: transaction,
    );
  }

  Future<List<EcclesiasticalHierarchy>> insert(
    _i1.Session session,
    List<EcclesiasticalHierarchy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EcclesiasticalHierarchy>(
      rows,
      transaction: transaction,
    );
  }

  Future<EcclesiasticalHierarchy> insertRow(
    _i1.Session session,
    EcclesiasticalHierarchy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EcclesiasticalHierarchy>(
      row,
      transaction: transaction,
    );
  }

  Future<List<EcclesiasticalHierarchy>> update(
    _i1.Session session,
    List<EcclesiasticalHierarchy> rows, {
    _i1.ColumnSelections<EcclesiasticalHierarchyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EcclesiasticalHierarchy>(
      rows,
      columns: columns?.call(EcclesiasticalHierarchy.t),
      transaction: transaction,
    );
  }

  Future<EcclesiasticalHierarchy> updateRow(
    _i1.Session session,
    EcclesiasticalHierarchy row, {
    _i1.ColumnSelections<EcclesiasticalHierarchyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EcclesiasticalHierarchy>(
      row,
      columns: columns?.call(EcclesiasticalHierarchy.t),
      transaction: transaction,
    );
  }

  Future<List<EcclesiasticalHierarchy>> delete(
    _i1.Session session,
    List<EcclesiasticalHierarchy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EcclesiasticalHierarchy>(
      rows,
      transaction: transaction,
    );
  }

  Future<EcclesiasticalHierarchy> deleteRow(
    _i1.Session session,
    EcclesiasticalHierarchy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EcclesiasticalHierarchy>(
      row,
      transaction: transaction,
    );
  }

  Future<List<EcclesiasticalHierarchy>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EcclesiasticalHierarchy>(
      where: where(EcclesiasticalHierarchy.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EcclesiasticalHierarchyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EcclesiasticalHierarchy>(
      where: where?.call(EcclesiasticalHierarchy.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
