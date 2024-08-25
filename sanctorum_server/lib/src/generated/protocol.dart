/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'birth.dart' as _i3;
import 'date.dart' as _i4;
import 'death.dart' as _i5;
import 'ecclesiastical_hierarchy.dart' as _i6;
import 'family.dart' as _i7;
import 'gender.dart' as _i8;
import 'miracle.dart' as _i9;
import 'quotation.dart' as _i10;
import 'religious_event.dart' as _i11;
import 'saint.dart' as _i12;
import 'veneration.dart' as _i13;
import 'protocol.dart' as _i14;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'birth',
      dartName: 'Birth',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'birth_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'period',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Date>?',
        ),
        _i2.ColumnDefinition(
          name: 'country',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'correspondentActualCountry',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'birth_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'date',
      dartName: 'Date',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'date_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'year',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'month',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'day',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'date_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'death',
      dartName: 'Death',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'death_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'period',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Date>?',
        ),
        _i2.ColumnDefinition(
          name: 'country',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'correspondentActualCountry',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isMartir',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'causeOfdeath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'death_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ecclesiastical_hierarchy',
      dartName: 'EcclesiasticalHierarchy',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ecclesiastical_hierarchy_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'hiearchyName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_saintEcclesiasticalhierarchySaintId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ecclesiastical_hierarchy_fk_0',
          columns: ['_saintEcclesiasticalhierarchySaintId'],
          referenceTable: 'saint',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ecclesiastical_hierarchy_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'family',
      dartName: 'Family',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'family_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'mother',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'father',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'numberOfSiblings',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'family_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'miracle',
      dartName: 'Miracle',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'miracle_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'details',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_saintMiraclesSaintId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'miracle_fk_0',
          columns: ['_saintMiraclesSaintId'],
          referenceTable: 'saint',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'miracle_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quotation',
      dartName: 'Quotation',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quotation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'quote',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'context',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'reference',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_saintQuotationsSaintId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'quotation_fk_0',
          columns: ['_saintQuotationsSaintId'],
          referenceTable: 'saint',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quotation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'religious_event',
      dartName: 'ReligiousEvent',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'religious_event_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'year',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_saintReligiouseventsSaintId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'religious_event_fk_0',
          columns: ['_saintReligiouseventsSaintId'],
          referenceTable: 'saint',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'religious_event_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'saint',
      dartName: 'Saint',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'saint_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'urlImage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'religiousName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'gender',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'birthId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deathId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'venerationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'academicTraining',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'cononizationDate',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:Date?',
        ),
        _i2.ColumnDefinition(
          name: 'beatificationDate',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:Date?',
        ),
        _i2.ColumnDefinition(
          name: 'prayers',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'summary',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'sourceLink',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fullText',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'sourceHtml',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'saint_fk_0',
          columns: ['birthId'],
          referenceTable: 'birth',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'saint_fk_1',
          columns: ['deathId'],
          referenceTable: 'death',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'saint_fk_2',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'saint_fk_3',
          columns: ['venerationId'],
          referenceTable: 'veneration',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'saint_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'veneration',
      dartName: 'Veneration',
      schema: 'public',
      module: 'sanctorum',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'veneration_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'celebrationDate',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'legacy',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'veneration_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Birth) {
      return _i3.Birth.fromJson(data) as T;
    }
    if (t == _i4.Date) {
      return _i4.Date.fromJson(data) as T;
    }
    if (t == _i5.Death) {
      return _i5.Death.fromJson(data) as T;
    }
    if (t == _i6.EcclesiasticalHierarchy) {
      return _i6.EcclesiasticalHierarchy.fromJson(data) as T;
    }
    if (t == _i7.Family) {
      return _i7.Family.fromJson(data) as T;
    }
    if (t == _i8.Gender) {
      return _i8.Gender.fromJson(data) as T;
    }
    if (t == _i9.Miracle) {
      return _i9.Miracle.fromJson(data) as T;
    }
    if (t == _i10.Quotation) {
      return _i10.Quotation.fromJson(data) as T;
    }
    if (t == _i11.ReligiousEvent) {
      return _i11.ReligiousEvent.fromJson(data) as T;
    }
    if (t == _i12.Saint) {
      return _i12.Saint.fromJson(data) as T;
    }
    if (t == _i13.Veneration) {
      return _i13.Veneration.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Birth?>()) {
      return (data != null ? _i3.Birth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Date?>()) {
      return (data != null ? _i4.Date.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Death?>()) {
      return (data != null ? _i5.Death.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.EcclesiasticalHierarchy?>()) {
      return (data != null ? _i6.EcclesiasticalHierarchy.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.Family?>()) {
      return (data != null ? _i7.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Gender?>()) {
      return (data != null ? _i8.Gender.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Miracle?>()) {
      return (data != null ? _i9.Miracle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Quotation?>()) {
      return (data != null ? _i10.Quotation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ReligiousEvent?>()) {
      return (data != null ? _i11.ReligiousEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Saint?>()) {
      return (data != null ? _i12.Saint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Veneration?>()) {
      return (data != null ? _i13.Veneration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i14.Date>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Date>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.Date>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Date>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.EcclesiasticalHierarchy>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i14.EcclesiasticalHierarchy>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.ReligiousEvent>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i14.ReligiousEvent>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.Miracle>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Miracle>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.Quotation>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Quotation>(e)).toList()
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
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Birth) {
      return 'Birth';
    }
    if (data is _i4.Date) {
      return 'Date';
    }
    if (data is _i5.Death) {
      return 'Death';
    }
    if (data is _i6.EcclesiasticalHierarchy) {
      return 'EcclesiasticalHierarchy';
    }
    if (data is _i7.Family) {
      return 'Family';
    }
    if (data is _i8.Gender) {
      return 'Gender';
    }
    if (data is _i9.Miracle) {
      return 'Miracle';
    }
    if (data is _i10.Quotation) {
      return 'Quotation';
    }
    if (data is _i11.ReligiousEvent) {
      return 'ReligiousEvent';
    }
    if (data is _i12.Saint) {
      return 'Saint';
    }
    if (data is _i13.Veneration) {
      return 'Veneration';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Birth') {
      return deserialize<_i3.Birth>(data['data']);
    }
    if (data['className'] == 'Date') {
      return deserialize<_i4.Date>(data['data']);
    }
    if (data['className'] == 'Death') {
      return deserialize<_i5.Death>(data['data']);
    }
    if (data['className'] == 'EcclesiasticalHierarchy') {
      return deserialize<_i6.EcclesiasticalHierarchy>(data['data']);
    }
    if (data['className'] == 'Family') {
      return deserialize<_i7.Family>(data['data']);
    }
    if (data['className'] == 'Gender') {
      return deserialize<_i8.Gender>(data['data']);
    }
    if (data['className'] == 'Miracle') {
      return deserialize<_i9.Miracle>(data['data']);
    }
    if (data['className'] == 'Quotation') {
      return deserialize<_i10.Quotation>(data['data']);
    }
    if (data['className'] == 'ReligiousEvent') {
      return deserialize<_i11.ReligiousEvent>(data['data']);
    }
    if (data['className'] == 'Saint') {
      return deserialize<_i12.Saint>(data['data']);
    }
    if (data['className'] == 'Veneration') {
      return deserialize<_i13.Veneration>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Birth:
        return _i3.Birth.t;
      case _i4.Date:
        return _i4.Date.t;
      case _i5.Death:
        return _i5.Death.t;
      case _i6.EcclesiasticalHierarchy:
        return _i6.EcclesiasticalHierarchy.t;
      case _i7.Family:
        return _i7.Family.t;
      case _i9.Miracle:
        return _i9.Miracle.t;
      case _i10.Quotation:
        return _i10.Quotation.t;
      case _i11.ReligiousEvent:
        return _i11.ReligiousEvent.t;
      case _i12.Saint:
        return _i12.Saint.t;
      case _i13.Veneration:
        return _i13.Veneration.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'sanctorum';
}
