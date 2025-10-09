// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<int> iconId = GeneratedColumn<int>(
    'icon_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _earnedXpMeta = const VerificationMeta(
    'earnedXp',
  );
  @override
  late final GeneratedColumn<int> earnedXp = GeneratedColumn<int>(
    'earned_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxXpMeta = const VerificationMeta('maxXp');
  @override
  late final GeneratedColumn<int> maxXp = GeneratedColumn<int>(
    'max_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    iconId,
    earnedXp,
    maxXp,
    level,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    }
    if (data.containsKey('earned_xp')) {
      context.handle(
        _earnedXpMeta,
        earnedXp.isAcceptableOrUnknown(data['earned_xp']!, _earnedXpMeta),
      );
    }
    if (data.containsKey('max_xp')) {
      context.handle(
        _maxXpMeta,
        maxXp.isAcceptableOrUnknown(data['max_xp']!, _maxXpMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_id'],
      )!,
      earnedXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}earned_xp'],
      )!,
      maxXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_xp'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int iconId;
  final int earnedXp;
  final int maxXp;
  final int level;
  const Category({
    required this.id,
    required this.name,
    required this.iconId,
    required this.earnedXp,
    required this.maxXp,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_id'] = Variable<int>(iconId);
    map['earned_xp'] = Variable<int>(earnedXp);
    map['max_xp'] = Variable<int>(maxXp);
    map['level'] = Variable<int>(level);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      iconId: Value(iconId),
      earnedXp: Value(earnedXp),
      maxXp: Value(maxXp),
      level: Value(level),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconId: serializer.fromJson<int>(json['iconId']),
      earnedXp: serializer.fromJson<int>(json['earnedXp']),
      maxXp: serializer.fromJson<int>(json['maxXp']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconId': serializer.toJson<int>(iconId),
      'earnedXp': serializer.toJson<int>(earnedXp),
      'maxXp': serializer.toJson<int>(maxXp),
      'level': serializer.toJson<int>(level),
    };
  }

  Category copyWith({
    int? id,
    String? name,
    int? iconId,
    int? earnedXp,
    int? maxXp,
    int? level,
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    iconId: iconId ?? this.iconId,
    earnedXp: earnedXp ?? this.earnedXp,
    maxXp: maxXp ?? this.maxXp,
    level: level ?? this.level,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
      earnedXp: data.earnedXp.present ? data.earnedXp.value : this.earnedXp,
      maxXp: data.maxXp.present ? data.maxXp.value : this.maxXp,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconId: $iconId, ')
          ..write('earnedXp: $earnedXp, ')
          ..write('maxXp: $maxXp, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconId, earnedXp, maxXp, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconId == this.iconId &&
          other.earnedXp == this.earnedXp &&
          other.maxXp == this.maxXp &&
          other.level == this.level);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> iconId;
  final Value<int> earnedXp;
  final Value<int> maxXp;
  final Value<int> level;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconId = const Value.absent(),
    this.earnedXp = const Value.absent(),
    this.maxXp = const Value.absent(),
    this.level = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.iconId = const Value.absent(),
    this.earnedXp = const Value.absent(),
    this.maxXp = const Value.absent(),
    this.level = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? iconId,
    Expression<int>? earnedXp,
    Expression<int>? maxXp,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconId != null) 'icon_id': iconId,
      if (earnedXp != null) 'earned_xp': earnedXp,
      if (maxXp != null) 'max_xp': maxXp,
      if (level != null) 'level': level,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? iconId,
    Value<int>? earnedXp,
    Value<int>? maxXp,
    Value<int>? level,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconId: iconId ?? this.iconId,
      earnedXp: earnedXp ?? this.earnedXp,
      maxXp: maxXp ?? this.maxXp,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    if (earnedXp.present) {
      map['earned_xp'] = Variable<int>(earnedXp.value);
    }
    if (maxXp.present) {
      map['max_xp'] = Variable<int>(maxXp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconId: $iconId, ')
          ..write('earnedXp: $earnedXp, ')
          ..write('maxXp: $maxXp, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _valMeta = const VerificationMeta('val');
  @override
  late final GeneratedColumn<int> val = GeneratedColumn<int>(
    'val',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, val];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('val')) {
      context.handle(
        _valMeta,
        val.isAcceptableOrUnknown(data['val']!, _valMeta),
      );
    } else if (isInserting) {
      context.missing(_valMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      val: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}val'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String name;
  final int val;
  const Setting({required this.id, required this.name, required this.val});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['val'] = Variable<int>(val);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(id: Value(id), name: Value(name), val: Value(val));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      val: serializer.fromJson<int>(json['val']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'val': serializer.toJson<int>(val),
    };
  }

  Setting copyWith({int? id, String? name, int? val}) =>
      Setting(id: id ?? this.id, name: name ?? this.name, val: val ?? this.val);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      val: data.val.present ? data.val.value : this.val,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('val: $val')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, val);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.name == this.name &&
          other.val == this.val);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> val;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.val = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int val,
  }) : name = Value(name),
       val = Value(val);
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? val,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (val != null) 'val': val,
    });
  }

  SettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? val,
  }) {
    return SettingsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      val: val ?? this.val,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (val.present) {
      map['val'] = Variable<int>(val.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('val: $val')
          ..write(')'))
        .toString();
  }
}

class $ZkrCategoriesTable extends ZkrCategories
    with TableInfo<$ZkrCategoriesTable, ZkrCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZkrCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zkr_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ZkrCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ZkrCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZkrCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $ZkrCategoriesTable createAlias(String alias) {
    return $ZkrCategoriesTable(attachedDatabase, alias);
  }
}

class ZkrCategory extends DataClass implements Insertable<ZkrCategory> {
  final int id;
  final String name;
  const ZkrCategory({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ZkrCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ZkrCategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory ZkrCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZkrCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ZkrCategory copyWith({int? id, String? name}) =>
      ZkrCategory(id: id ?? this.id, name: name ?? this.name);
  ZkrCategory copyWithCompanion(ZkrCategoriesCompanion data) {
    return ZkrCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ZkrCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZkrCategory && other.id == this.id && other.name == this.name);
}

class ZkrCategoriesCompanion extends UpdateCompanion<ZkrCategory> {
  final Value<int> id;
  final Value<String> name;
  const ZkrCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ZkrCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ZkrCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ZkrCategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ZkrCategoriesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZkrCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ZkrsTable extends Zkrs with TableInfo<$ZkrsTable, Zkr> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZkrsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zkrs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Zkr> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Zkr map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Zkr(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  $ZkrsTable createAlias(String alias) {
    return $ZkrsTable(attachedDatabase, alias);
  }
}

class Zkr extends DataClass implements Insertable<Zkr> {
  final int id;
  final String name;
  final String content;
  const Zkr({required this.id, required this.name, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['content'] = Variable<String>(content);
    return map;
  }

  ZkrsCompanion toCompanion(bool nullToAbsent) {
    return ZkrsCompanion(
      id: Value(id),
      name: Value(name),
      content: Value(content),
    );
  }

  factory Zkr.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Zkr(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'content': serializer.toJson<String>(content),
    };
  }

  Zkr copyWith({int? id, String? name, String? content}) => Zkr(
    id: id ?? this.id,
    name: name ?? this.name,
    content: content ?? this.content,
  );
  Zkr copyWithCompanion(ZkrsCompanion data) {
    return Zkr(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Zkr(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zkr &&
          other.id == this.id &&
          other.name == this.name &&
          other.content == this.content);
}

class ZkrsCompanion extends UpdateCompanion<Zkr> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> content;
  const ZkrsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.content = const Value.absent(),
  });
  ZkrsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String content,
  }) : name = Value(name),
       content = Value(content);
  static Insertable<Zkr> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (content != null) 'content': content,
    });
  }

  ZkrsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? content,
  }) {
    return ZkrsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZkrsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $ZkrTimesTable extends ZkrTimes with TableInfo<$ZkrTimesTable, ZkrTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZkrTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _zkrIdMeta = const VerificationMeta('zkrId');
  @override
  late final GeneratedColumn<int> zkrId = GeneratedColumn<int>(
    'zkr_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES zkrs (id)',
    ),
  );
  static const VerificationMeta _zkrCategoryIdMeta = const VerificationMeta(
    'zkrCategoryId',
  );
  @override
  late final GeneratedColumn<int> zkrCategoryId = GeneratedColumn<int>(
    'zkr_category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES zkr_categories (id)',
    ),
  );
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<int> repeat = GeneratedColumn<int>(
    'repeat',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    zkrId,
    zkrCategoryId,
    repeat,
    rank,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zkr_times';
  @override
  VerificationContext validateIntegrity(
    Insertable<ZkrTime> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('zkr_id')) {
      context.handle(
        _zkrIdMeta,
        zkrId.isAcceptableOrUnknown(data['zkr_id']!, _zkrIdMeta),
      );
    } else if (isInserting) {
      context.missing(_zkrIdMeta);
    }
    if (data.containsKey('zkr_category_id')) {
      context.handle(
        _zkrCategoryIdMeta,
        zkrCategoryId.isAcceptableOrUnknown(
          data['zkr_category_id']!,
          _zkrCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_zkrCategoryIdMeta);
    }
    if (data.containsKey('repeat')) {
      context.handle(
        _repeatMeta,
        repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta),
      );
    } else if (isInserting) {
      context.missing(_repeatMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ZkrTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZkrTime(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      zkrId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zkr_id'],
      )!,
      zkrCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zkr_category_id'],
      )!,
      repeat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repeat'],
      )!,
      rank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rank'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ZkrTimesTable createAlias(String alias) {
    return $ZkrTimesTable(attachedDatabase, alias);
  }
}

class ZkrTime extends DataClass implements Insertable<ZkrTime> {
  final int id;
  final int zkrId;
  final int zkrCategoryId;
  final int repeat;
  final int rank;
  final String? description;
  const ZkrTime({
    required this.id,
    required this.zkrId,
    required this.zkrCategoryId,
    required this.repeat,
    required this.rank,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['zkr_id'] = Variable<int>(zkrId);
    map['zkr_category_id'] = Variable<int>(zkrCategoryId);
    map['repeat'] = Variable<int>(repeat);
    map['rank'] = Variable<int>(rank);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ZkrTimesCompanion toCompanion(bool nullToAbsent) {
    return ZkrTimesCompanion(
      id: Value(id),
      zkrId: Value(zkrId),
      zkrCategoryId: Value(zkrCategoryId),
      repeat: Value(repeat),
      rank: Value(rank),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory ZkrTime.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZkrTime(
      id: serializer.fromJson<int>(json['id']),
      zkrId: serializer.fromJson<int>(json['zkrId']),
      zkrCategoryId: serializer.fromJson<int>(json['zkrCategoryId']),
      repeat: serializer.fromJson<int>(json['repeat']),
      rank: serializer.fromJson<int>(json['rank']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'zkrId': serializer.toJson<int>(zkrId),
      'zkrCategoryId': serializer.toJson<int>(zkrCategoryId),
      'repeat': serializer.toJson<int>(repeat),
      'rank': serializer.toJson<int>(rank),
      'description': serializer.toJson<String?>(description),
    };
  }

  ZkrTime copyWith({
    int? id,
    int? zkrId,
    int? zkrCategoryId,
    int? repeat,
    int? rank,
    Value<String?> description = const Value.absent(),
  }) => ZkrTime(
    id: id ?? this.id,
    zkrId: zkrId ?? this.zkrId,
    zkrCategoryId: zkrCategoryId ?? this.zkrCategoryId,
    repeat: repeat ?? this.repeat,
    rank: rank ?? this.rank,
    description: description.present ? description.value : this.description,
  );
  ZkrTime copyWithCompanion(ZkrTimesCompanion data) {
    return ZkrTime(
      id: data.id.present ? data.id.value : this.id,
      zkrId: data.zkrId.present ? data.zkrId.value : this.zkrId,
      zkrCategoryId: data.zkrCategoryId.present
          ? data.zkrCategoryId.value
          : this.zkrCategoryId,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      rank: data.rank.present ? data.rank.value : this.rank,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ZkrTime(')
          ..write('id: $id, ')
          ..write('zkrId: $zkrId, ')
          ..write('zkrCategoryId: $zkrCategoryId, ')
          ..write('repeat: $repeat, ')
          ..write('rank: $rank, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, zkrId, zkrCategoryId, repeat, rank, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZkrTime &&
          other.id == this.id &&
          other.zkrId == this.zkrId &&
          other.zkrCategoryId == this.zkrCategoryId &&
          other.repeat == this.repeat &&
          other.rank == this.rank &&
          other.description == this.description);
}

class ZkrTimesCompanion extends UpdateCompanion<ZkrTime> {
  final Value<int> id;
  final Value<int> zkrId;
  final Value<int> zkrCategoryId;
  final Value<int> repeat;
  final Value<int> rank;
  final Value<String?> description;
  const ZkrTimesCompanion({
    this.id = const Value.absent(),
    this.zkrId = const Value.absent(),
    this.zkrCategoryId = const Value.absent(),
    this.repeat = const Value.absent(),
    this.rank = const Value.absent(),
    this.description = const Value.absent(),
  });
  ZkrTimesCompanion.insert({
    this.id = const Value.absent(),
    required int zkrId,
    required int zkrCategoryId,
    required int repeat,
    required int rank,
    this.description = const Value.absent(),
  }) : zkrId = Value(zkrId),
       zkrCategoryId = Value(zkrCategoryId),
       repeat = Value(repeat),
       rank = Value(rank);
  static Insertable<ZkrTime> custom({
    Expression<int>? id,
    Expression<int>? zkrId,
    Expression<int>? zkrCategoryId,
    Expression<int>? repeat,
    Expression<int>? rank,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (zkrId != null) 'zkr_id': zkrId,
      if (zkrCategoryId != null) 'zkr_category_id': zkrCategoryId,
      if (repeat != null) 'repeat': repeat,
      if (rank != null) 'rank': rank,
      if (description != null) 'description': description,
    });
  }

  ZkrTimesCompanion copyWith({
    Value<int>? id,
    Value<int>? zkrId,
    Value<int>? zkrCategoryId,
    Value<int>? repeat,
    Value<int>? rank,
    Value<String?>? description,
  }) {
    return ZkrTimesCompanion(
      id: id ?? this.id,
      zkrId: zkrId ?? this.zkrId,
      zkrCategoryId: zkrCategoryId ?? this.zkrCategoryId,
      repeat: repeat ?? this.repeat,
      rank: rank ?? this.rank,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (zkrId.present) {
      map['zkr_id'] = Variable<int>(zkrId.value);
    }
    if (zkrCategoryId.present) {
      map['zkr_category_id'] = Variable<int>(zkrCategoryId.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<int>(repeat.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZkrTimesCompanion(')
          ..write('id: $id, ')
          ..write('zkrId: $zkrId, ')
          ..write('zkrCategoryId: $zkrCategoryId, ')
          ..write('repeat: $repeat, ')
          ..write('rank: $rank, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $ZkrCategoriesTable zkrCategories = $ZkrCategoriesTable(this);
  late final $ZkrsTable zkrs = $ZkrsTable(this);
  late final $ZkrTimesTable zkrTimes = $ZkrTimesTable(this);
  late final SettingDao settingDao = SettingDao(this as AppDatabase);
  late final AzkarDao azkarDao = AzkarDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    settings,
    zkrCategories,
    zkrs,
    zkrTimes,
  ];
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      Value<int> iconId,
      Value<int> earnedXp,
      Value<int> maxXp,
      Value<int> level,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> iconId,
      Value<int> earnedXp,
      Value<int> maxXp,
      Value<int> level,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get earnedXp => $composableBuilder(
    column: $table.earnedXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxXp => $composableBuilder(
    column: $table.maxXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get earnedXp => $composableBuilder(
    column: $table.earnedXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxXp => $composableBuilder(
    column: $table.maxXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get iconId =>
      $composableBuilder(column: $table.iconId, builder: (column) => column);

  GeneratedColumn<int> get earnedXp =>
      $composableBuilder(column: $table.earnedXp, builder: (column) => column);

  GeneratedColumn<int> get maxXp =>
      $composableBuilder(column: $table.maxXp, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> iconId = const Value.absent(),
                Value<int> earnedXp = const Value.absent(),
                Value<int> maxXp = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                iconId: iconId,
                earnedXp: earnedXp,
                maxXp: maxXp,
                level: level,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int> iconId = const Value.absent(),
                Value<int> earnedXp = const Value.absent(),
                Value<int> maxXp = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                iconId: iconId,
                earnedXp: earnedXp,
                maxXp: maxXp,
                level: level,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      required String name,
      required int val,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> val,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get val => $composableBuilder(
    column: $table.val,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get val => $composableBuilder(
    column: $table.val,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get val =>
      $composableBuilder(column: $table.val, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> val = const Value.absent(),
              }) => SettingsCompanion(id: id, name: name, val: val),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int val,
              }) => SettingsCompanion.insert(id: id, name: name, val: val),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$ZkrCategoriesTableCreateCompanionBuilder =
    ZkrCategoriesCompanion Function({Value<int> id, required String name});
typedef $$ZkrCategoriesTableUpdateCompanionBuilder =
    ZkrCategoriesCompanion Function({Value<int> id, Value<String> name});

final class $$ZkrCategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $ZkrCategoriesTable, ZkrCategory> {
  $$ZkrCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ZkrTimesTable, List<ZkrTime>> _zkrTimesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.zkrTimes,
    aliasName: $_aliasNameGenerator(
      db.zkrCategories.id,
      db.zkrTimes.zkrCategoryId,
    ),
  );

  $$ZkrTimesTableProcessedTableManager get zkrTimesRefs {
    final manager = $$ZkrTimesTableTableManager(
      $_db,
      $_db.zkrTimes,
    ).filter((f) => f.zkrCategoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_zkrTimesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ZkrCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ZkrCategoriesTable> {
  $$ZkrCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> zkrTimesRefs(
    Expression<bool> Function($$ZkrTimesTableFilterComposer f) f,
  ) {
    final $$ZkrTimesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.zkrTimes,
      getReferencedColumn: (t) => t.zkrCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrTimesTableFilterComposer(
            $db: $db,
            $table: $db.zkrTimes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ZkrCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ZkrCategoriesTable> {
  $$ZkrCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ZkrCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ZkrCategoriesTable> {
  $$ZkrCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> zkrTimesRefs<T extends Object>(
    Expression<T> Function($$ZkrTimesTableAnnotationComposer a) f,
  ) {
    final $$ZkrTimesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.zkrTimes,
      getReferencedColumn: (t) => t.zkrCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrTimesTableAnnotationComposer(
            $db: $db,
            $table: $db.zkrTimes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ZkrCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ZkrCategoriesTable,
          ZkrCategory,
          $$ZkrCategoriesTableFilterComposer,
          $$ZkrCategoriesTableOrderingComposer,
          $$ZkrCategoriesTableAnnotationComposer,
          $$ZkrCategoriesTableCreateCompanionBuilder,
          $$ZkrCategoriesTableUpdateCompanionBuilder,
          (ZkrCategory, $$ZkrCategoriesTableReferences),
          ZkrCategory,
          PrefetchHooks Function({bool zkrTimesRefs})
        > {
  $$ZkrCategoriesTableTableManager(_$AppDatabase db, $ZkrCategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ZkrCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ZkrCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ZkrCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => ZkrCategoriesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  ZkrCategoriesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ZkrCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({zkrTimesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (zkrTimesRefs) db.zkrTimes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (zkrTimesRefs)
                    await $_getPrefetchedData<
                      ZkrCategory,
                      $ZkrCategoriesTable,
                      ZkrTime
                    >(
                      currentTable: table,
                      referencedTable: $$ZkrCategoriesTableReferences
                          ._zkrTimesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ZkrCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).zkrTimesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.zkrCategoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ZkrCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ZkrCategoriesTable,
      ZkrCategory,
      $$ZkrCategoriesTableFilterComposer,
      $$ZkrCategoriesTableOrderingComposer,
      $$ZkrCategoriesTableAnnotationComposer,
      $$ZkrCategoriesTableCreateCompanionBuilder,
      $$ZkrCategoriesTableUpdateCompanionBuilder,
      (ZkrCategory, $$ZkrCategoriesTableReferences),
      ZkrCategory,
      PrefetchHooks Function({bool zkrTimesRefs})
    >;
typedef $$ZkrsTableCreateCompanionBuilder =
    ZkrsCompanion Function({
      Value<int> id,
      required String name,
      required String content,
    });
typedef $$ZkrsTableUpdateCompanionBuilder =
    ZkrsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> content,
    });

final class $$ZkrsTableReferences
    extends BaseReferences<_$AppDatabase, $ZkrsTable, Zkr> {
  $$ZkrsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ZkrTimesTable, List<ZkrTime>> _zkrTimesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.zkrTimes,
    aliasName: $_aliasNameGenerator(db.zkrs.id, db.zkrTimes.zkrId),
  );

  $$ZkrTimesTableProcessedTableManager get zkrTimesRefs {
    final manager = $$ZkrTimesTableTableManager(
      $_db,
      $_db.zkrTimes,
    ).filter((f) => f.zkrId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_zkrTimesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ZkrsTableFilterComposer extends Composer<_$AppDatabase, $ZkrsTable> {
  $$ZkrsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> zkrTimesRefs(
    Expression<bool> Function($$ZkrTimesTableFilterComposer f) f,
  ) {
    final $$ZkrTimesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.zkrTimes,
      getReferencedColumn: (t) => t.zkrId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrTimesTableFilterComposer(
            $db: $db,
            $table: $db.zkrTimes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ZkrsTableOrderingComposer extends Composer<_$AppDatabase, $ZkrsTable> {
  $$ZkrsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ZkrsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ZkrsTable> {
  $$ZkrsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  Expression<T> zkrTimesRefs<T extends Object>(
    Expression<T> Function($$ZkrTimesTableAnnotationComposer a) f,
  ) {
    final $$ZkrTimesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.zkrTimes,
      getReferencedColumn: (t) => t.zkrId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrTimesTableAnnotationComposer(
            $db: $db,
            $table: $db.zkrTimes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ZkrsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ZkrsTable,
          Zkr,
          $$ZkrsTableFilterComposer,
          $$ZkrsTableOrderingComposer,
          $$ZkrsTableAnnotationComposer,
          $$ZkrsTableCreateCompanionBuilder,
          $$ZkrsTableUpdateCompanionBuilder,
          (Zkr, $$ZkrsTableReferences),
          Zkr,
          PrefetchHooks Function({bool zkrTimesRefs})
        > {
  $$ZkrsTableTableManager(_$AppDatabase db, $ZkrsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ZkrsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ZkrsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ZkrsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> content = const Value.absent(),
              }) => ZkrsCompanion(id: id, name: name, content: content),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String content,
              }) => ZkrsCompanion.insert(id: id, name: name, content: content),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ZkrsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({zkrTimesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (zkrTimesRefs) db.zkrTimes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (zkrTimesRefs)
                    await $_getPrefetchedData<Zkr, $ZkrsTable, ZkrTime>(
                      currentTable: table,
                      referencedTable: $$ZkrsTableReferences._zkrTimesRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$ZkrsTableReferences(db, table, p0).zkrTimesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.zkrId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ZkrsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ZkrsTable,
      Zkr,
      $$ZkrsTableFilterComposer,
      $$ZkrsTableOrderingComposer,
      $$ZkrsTableAnnotationComposer,
      $$ZkrsTableCreateCompanionBuilder,
      $$ZkrsTableUpdateCompanionBuilder,
      (Zkr, $$ZkrsTableReferences),
      Zkr,
      PrefetchHooks Function({bool zkrTimesRefs})
    >;
typedef $$ZkrTimesTableCreateCompanionBuilder =
    ZkrTimesCompanion Function({
      Value<int> id,
      required int zkrId,
      required int zkrCategoryId,
      required int repeat,
      required int rank,
      Value<String?> description,
    });
typedef $$ZkrTimesTableUpdateCompanionBuilder =
    ZkrTimesCompanion Function({
      Value<int> id,
      Value<int> zkrId,
      Value<int> zkrCategoryId,
      Value<int> repeat,
      Value<int> rank,
      Value<String?> description,
    });

final class $$ZkrTimesTableReferences
    extends BaseReferences<_$AppDatabase, $ZkrTimesTable, ZkrTime> {
  $$ZkrTimesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ZkrsTable _zkrIdTable(_$AppDatabase db) =>
      db.zkrs.createAlias($_aliasNameGenerator(db.zkrTimes.zkrId, db.zkrs.id));

  $$ZkrsTableProcessedTableManager get zkrId {
    final $_column = $_itemColumn<int>('zkr_id')!;

    final manager = $$ZkrsTableTableManager(
      $_db,
      $_db.zkrs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zkrIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ZkrCategoriesTable _zkrCategoryIdTable(_$AppDatabase db) =>
      db.zkrCategories.createAlias(
        $_aliasNameGenerator(db.zkrTimes.zkrCategoryId, db.zkrCategories.id),
      );

  $$ZkrCategoriesTableProcessedTableManager get zkrCategoryId {
    final $_column = $_itemColumn<int>('zkr_category_id')!;

    final manager = $$ZkrCategoriesTableTableManager(
      $_db,
      $_db.zkrCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zkrCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ZkrTimesTableFilterComposer
    extends Composer<_$AppDatabase, $ZkrTimesTable> {
  $$ZkrTimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$ZkrsTableFilterComposer get zkrId {
    final $$ZkrsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrId,
      referencedTable: $db.zkrs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrsTableFilterComposer(
            $db: $db,
            $table: $db.zkrs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ZkrCategoriesTableFilterComposer get zkrCategoryId {
    final $$ZkrCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrCategoryId,
      referencedTable: $db.zkrCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.zkrCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ZkrTimesTableOrderingComposer
    extends Composer<_$AppDatabase, $ZkrTimesTable> {
  $$ZkrTimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$ZkrsTableOrderingComposer get zkrId {
    final $$ZkrsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrId,
      referencedTable: $db.zkrs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrsTableOrderingComposer(
            $db: $db,
            $table: $db.zkrs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ZkrCategoriesTableOrderingComposer get zkrCategoryId {
    final $$ZkrCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrCategoryId,
      referencedTable: $db.zkrCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.zkrCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ZkrTimesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ZkrTimesTable> {
  $$ZkrTimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$ZkrsTableAnnotationComposer get zkrId {
    final $$ZkrsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrId,
      referencedTable: $db.zkrs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrsTableAnnotationComposer(
            $db: $db,
            $table: $db.zkrs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ZkrCategoriesTableAnnotationComposer get zkrCategoryId {
    final $$ZkrCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zkrCategoryId,
      referencedTable: $db.zkrCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ZkrCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.zkrCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ZkrTimesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ZkrTimesTable,
          ZkrTime,
          $$ZkrTimesTableFilterComposer,
          $$ZkrTimesTableOrderingComposer,
          $$ZkrTimesTableAnnotationComposer,
          $$ZkrTimesTableCreateCompanionBuilder,
          $$ZkrTimesTableUpdateCompanionBuilder,
          (ZkrTime, $$ZkrTimesTableReferences),
          ZkrTime,
          PrefetchHooks Function({bool zkrId, bool zkrCategoryId})
        > {
  $$ZkrTimesTableTableManager(_$AppDatabase db, $ZkrTimesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ZkrTimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ZkrTimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ZkrTimesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> zkrId = const Value.absent(),
                Value<int> zkrCategoryId = const Value.absent(),
                Value<int> repeat = const Value.absent(),
                Value<int> rank = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ZkrTimesCompanion(
                id: id,
                zkrId: zkrId,
                zkrCategoryId: zkrCategoryId,
                repeat: repeat,
                rank: rank,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int zkrId,
                required int zkrCategoryId,
                required int repeat,
                required int rank,
                Value<String?> description = const Value.absent(),
              }) => ZkrTimesCompanion.insert(
                id: id,
                zkrId: zkrId,
                zkrCategoryId: zkrCategoryId,
                repeat: repeat,
                rank: rank,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ZkrTimesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({zkrId = false, zkrCategoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (zkrId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.zkrId,
                                referencedTable: $$ZkrTimesTableReferences
                                    ._zkrIdTable(db),
                                referencedColumn: $$ZkrTimesTableReferences
                                    ._zkrIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (zkrCategoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.zkrCategoryId,
                                referencedTable: $$ZkrTimesTableReferences
                                    ._zkrCategoryIdTable(db),
                                referencedColumn: $$ZkrTimesTableReferences
                                    ._zkrCategoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ZkrTimesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ZkrTimesTable,
      ZkrTime,
      $$ZkrTimesTableFilterComposer,
      $$ZkrTimesTableOrderingComposer,
      $$ZkrTimesTableAnnotationComposer,
      $$ZkrTimesTableCreateCompanionBuilder,
      $$ZkrTimesTableUpdateCompanionBuilder,
      (ZkrTime, $$ZkrTimesTableReferences),
      ZkrTime,
      PrefetchHooks Function({bool zkrId, bool zkrCategoryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$ZkrCategoriesTableTableManager get zkrCategories =>
      $$ZkrCategoriesTableTableManager(_db, _db.zkrCategories);
  $$ZkrsTableTableManager get zkrs => $$ZkrsTableTableManager(_db, _db.zkrs);
  $$ZkrTimesTableTableManager get zkrTimes =>
      $$ZkrTimesTableTableManager(_db, _db.zkrTimes);
}

mixin _$SettingDaoMixin on DatabaseAccessor<AppDatabase> {
  $SettingsTable get settings => attachedDatabase.settings;
}
mixin _$AzkarDaoMixin on DatabaseAccessor<AppDatabase> {
  $ZkrCategoriesTable get zkrCategories => attachedDatabase.zkrCategories;
  $ZkrsTable get zkrs => attachedDatabase.zkrs;
  $ZkrTimesTable get zkrTimes => attachedDatabase.zkrTimes;
}
