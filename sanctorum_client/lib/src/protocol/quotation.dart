/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Quotation implements _i1.SerializableModel {
  Quotation._({
    this.id,
    this.quote,
    this.context,
    this.reference,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? quote;

  String? context;

  String? reference;

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
    };
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
