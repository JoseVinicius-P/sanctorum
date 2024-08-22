/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Quotation extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Quotation._({
    int? id,
    this.quote,
    this.context,
    this.reference,
  }) : super(id);

  factory Quotation({
    int? id,
    String? quote,
    String? context,
    String? reference,
  }) = _QuotationImpl;

  factory Quotation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quotation(
      id: jsonSerialization['id'] as int?,
      quote: jsonSerialization['quote'] as String?,
      context: jsonSerialization['context'] as String?,
      reference: jsonSerialization['reference'] as String?,
    );
  }

  static final t = QuotationTable();

  static const db = QuotationRepository._();

  String? quote;

  String? context;

  String? reference;

  int? _saintQuotationsSaintId;

  @override
  _i1.Table get table => t;

  Quotation copyWith({
    int? id,
    String? quote,
    String? context,
    String? reference,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (quote != null) 'quote': quote,
      if (context != null) 'context': context,
      if (reference != null) 'reference': reference,
      if (_saintQuotationsSaintId != null)
        '_saintQuotationsSaintId': _saintQuotationsSaintId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (quote != null) 'quote': quote,
      if (context != null) 'context': context,
      if (reference != null) 'reference': reference,
    };
  }

  static QuotationInclude include() {
    return QuotationInclude._();
  }

  static QuotationIncludeList includeList({
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    QuotationInclude? include,
  }) {
    return QuotationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quotation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quotation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuotationImpl extends Quotation {
  _QuotationImpl({
    int? id,
    String? quote,
    String? context,
    String? reference,
  }) : super._(
          id: id,
          quote: quote,
          context: context,
          reference: reference,
        );

  @override
  Quotation copyWith({
    Object? id = _Undefined,
    Object? quote = _Undefined,
    Object? context = _Undefined,
    Object? reference = _Undefined,
  }) {
    return Quotation(
      id: id is int? ? id : this.id,
      quote: quote is String? ? quote : this.quote,
      context: context is String? ? context : this.context,
      reference: reference is String? ? reference : this.reference,
    );
  }
}

class QuotationImplicit extends _QuotationImpl {
  QuotationImplicit._({
    int? id,
    String? quote,
    String? context,
    String? reference,
    this.$_saintQuotationsSaintId,
  }) : super(
          id: id,
          quote: quote,
          context: context,
          reference: reference,
        );

  factory QuotationImplicit(
    Quotation quotation, {
    int? $_saintQuotationsSaintId,
  }) {
    return QuotationImplicit._(
      id: quotation.id,
      quote: quotation.quote,
      context: quotation.context,
      reference: quotation.reference,
      $_saintQuotationsSaintId: $_saintQuotationsSaintId,
    );
  }

  int? $_saintQuotationsSaintId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_saintQuotationsSaintId': $_saintQuotationsSaintId});
    return jsonMap;
  }
}

class QuotationTable extends _i1.Table {
  QuotationTable({super.tableRelation}) : super(tableName: 'quotation') {
    quote = _i1.ColumnString(
      'quote',
      this,
    );
    context = _i1.ColumnString(
      'context',
      this,
    );
    reference = _i1.ColumnString(
      'reference',
      this,
    );
    $_saintQuotationsSaintId = _i1.ColumnInt(
      '_saintQuotationsSaintId',
      this,
    );
  }

  late final _i1.ColumnString quote;

  late final _i1.ColumnString context;

  late final _i1.ColumnString reference;

  late final _i1.ColumnInt $_saintQuotationsSaintId;

  @override
  List<_i1.Column> get columns => [
        id,
        quote,
        context,
        reference,
        $_saintQuotationsSaintId,
      ];
}

class QuotationInclude extends _i1.IncludeObject {
  QuotationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Quotation.t;
}

class QuotationIncludeList extends _i1.IncludeList {
  QuotationIncludeList._({
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quotation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Quotation.t;
}

class QuotationRepository {
  const QuotationRepository._();

  Future<List<Quotation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Quotation>(
      where: where?.call(Quotation.t),
      orderBy: orderBy?.call(Quotation.t),
      orderByList: orderByList?.call(Quotation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Quotation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuotationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuotationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Quotation>(
      where: where?.call(Quotation.t),
      orderBy: orderBy?.call(Quotation.t),
      orderByList: orderByList?.call(Quotation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Quotation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Quotation>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Quotation>> insert(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Quotation>(
      rows,
      transaction: transaction,
    );
  }

  Future<Quotation> insertRow(
    _i1.Session session,
    Quotation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quotation>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Quotation>> update(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.ColumnSelections<QuotationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Quotation>(
      rows,
      columns: columns?.call(Quotation.t),
      transaction: transaction,
    );
  }

  Future<Quotation> updateRow(
    _i1.Session session,
    Quotation row, {
    _i1.ColumnSelections<QuotationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quotation>(
      row,
      columns: columns?.call(Quotation.t),
      transaction: transaction,
    );
  }

  Future<List<Quotation>> delete(
    _i1.Session session,
    List<Quotation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quotation>(
      rows,
      transaction: transaction,
    );
  }

  Future<Quotation> deleteRow(
    _i1.Session session,
    Quotation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quotation>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Quotation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuotationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Quotation>(
      where: where(Quotation.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuotationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quotation>(
      where: where?.call(Quotation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
