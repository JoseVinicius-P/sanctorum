/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'birth.dart' as _i2;
import 'date.dart' as _i3;
import 'death.dart' as _i4;
import 'ecclesiastical_hierarchy.dart' as _i5;
import 'family.dart' as _i6;
import 'gender.dart' as _i7;
import 'miracle.dart' as _i8;
import 'quotation.dart' as _i9;
import 'religious_event.dart' as _i10;
import 'saint.dart' as _i11;
import 'veneration.dart' as _i12;
import 'protocol.dart' as _i13;
import 'package:sanctorum_client/src/protocol/saint.dart' as _i14;
export 'birth.dart';
export 'date.dart';
export 'death.dart';
export 'ecclesiastical_hierarchy.dart';
export 'family.dart';
export 'gender.dart';
export 'miracle.dart';
export 'quotation.dart';
export 'religious_event.dart';
export 'saint.dart';
export 'veneration.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Birth) {
      return _i2.Birth.fromJson(data) as T;
    }
    if (t == _i3.Date) {
      return _i3.Date.fromJson(data) as T;
    }
    if (t == _i4.Death) {
      return _i4.Death.fromJson(data) as T;
    }
    if (t == _i5.EcclesiasticalHierarchy) {
      return _i5.EcclesiasticalHierarchy.fromJson(data) as T;
    }
    if (t == _i6.Family) {
      return _i6.Family.fromJson(data) as T;
    }
    if (t == _i7.Gender) {
      return _i7.Gender.fromJson(data) as T;
    }
    if (t == _i8.Miracle) {
      return _i8.Miracle.fromJson(data) as T;
    }
    if (t == _i9.Quotation) {
      return _i9.Quotation.fromJson(data) as T;
    }
    if (t == _i10.ReligiousEvent) {
      return _i10.ReligiousEvent.fromJson(data) as T;
    }
    if (t == _i11.Saint) {
      return _i11.Saint.fromJson(data) as T;
    }
    if (t == _i12.Veneration) {
      return _i12.Veneration.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Birth?>()) {
      return (data != null ? _i2.Birth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Date?>()) {
      return (data != null ? _i3.Date.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Death?>()) {
      return (data != null ? _i4.Death.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.EcclesiasticalHierarchy?>()) {
      return (data != null ? _i5.EcclesiasticalHierarchy.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Family?>()) {
      return (data != null ? _i6.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Gender?>()) {
      return (data != null ? _i7.Gender.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Miracle?>()) {
      return (data != null ? _i8.Miracle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Quotation?>()) {
      return (data != null ? _i9.Quotation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ReligiousEvent?>()) {
      return (data != null ? _i10.ReligiousEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Saint?>()) {
      return (data != null ? _i11.Saint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Veneration?>()) {
      return (data != null ? _i12.Veneration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i13.Date>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Date>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Date>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Date>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.EcclesiasticalHierarchy>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.EcclesiasticalHierarchy>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.ReligiousEvent>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.ReligiousEvent>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Miracle>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Miracle>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Quotation>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Quotation>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i14.Saint>) {
      return (data as List).map((e) => deserialize<_i14.Saint>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Birth) {
      return 'Birth';
    }
    if (data is _i3.Date) {
      return 'Date';
    }
    if (data is _i4.Death) {
      return 'Death';
    }
    if (data is _i5.EcclesiasticalHierarchy) {
      return 'EcclesiasticalHierarchy';
    }
    if (data is _i6.Family) {
      return 'Family';
    }
    if (data is _i7.Gender) {
      return 'Gender';
    }
    if (data is _i8.Miracle) {
      return 'Miracle';
    }
    if (data is _i9.Quotation) {
      return 'Quotation';
    }
    if (data is _i10.ReligiousEvent) {
      return 'ReligiousEvent';
    }
    if (data is _i11.Saint) {
      return 'Saint';
    }
    if (data is _i12.Veneration) {
      return 'Veneration';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Birth') {
      return deserialize<_i2.Birth>(data['data']);
    }
    if (data['className'] == 'Date') {
      return deserialize<_i3.Date>(data['data']);
    }
    if (data['className'] == 'Death') {
      return deserialize<_i4.Death>(data['data']);
    }
    if (data['className'] == 'EcclesiasticalHierarchy') {
      return deserialize<_i5.EcclesiasticalHierarchy>(data['data']);
    }
    if (data['className'] == 'Family') {
      return deserialize<_i6.Family>(data['data']);
    }
    if (data['className'] == 'Gender') {
      return deserialize<_i7.Gender>(data['data']);
    }
    if (data['className'] == 'Miracle') {
      return deserialize<_i8.Miracle>(data['data']);
    }
    if (data['className'] == 'Quotation') {
      return deserialize<_i9.Quotation>(data['data']);
    }
    if (data['className'] == 'ReligiousEvent') {
      return deserialize<_i10.ReligiousEvent>(data['data']);
    }
    if (data['className'] == 'Saint') {
      return deserialize<_i11.Saint>(data['data']);
    }
    if (data['className'] == 'Veneration') {
      return deserialize<_i12.Veneration>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
