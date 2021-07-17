// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_prefs.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ThemePref extends DataClass implements Insertable<ThemePref> {
  final int themeId;
  final String themeName;
  ThemePref({@required this.themeId, @required this.themeName});
  factory ThemePref.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return ThemePref(
      themeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}theme_id']),
      themeName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}theme_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || themeId != null) {
      map['theme_id'] = Variable<int>(themeId);
    }
    if (!nullToAbsent || themeName != null) {
      map['theme_name'] = Variable<String>(themeName);
    }
    return map;
  }

  ThemePrefsCompanion toCompanion(bool nullToAbsent) {
    return ThemePrefsCompanion(
      themeId: themeId == null && nullToAbsent
          ? const Value.absent()
          : Value(themeId),
      themeName: themeName == null && nullToAbsent
          ? const Value.absent()
          : Value(themeName),
    );
  }

  factory ThemePref.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ThemePref(
      themeId: serializer.fromJson<int>(json['themeId']),
      themeName: serializer.fromJson<String>(json['themeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'themeId': serializer.toJson<int>(themeId),
      'themeName': serializer.toJson<String>(themeName),
    };
  }

  ThemePref copyWith({int themeId, String themeName}) => ThemePref(
        themeId: themeId ?? this.themeId,
        themeName: themeName ?? this.themeName,
      );
  @override
  String toString() {
    return (StringBuffer('ThemePref(')
          ..write('themeId: $themeId, ')
          ..write('themeName: $themeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(themeId.hashCode, themeName.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemePref &&
          other.themeId == this.themeId &&
          other.themeName == this.themeName);
}

class ThemePrefsCompanion extends UpdateCompanion<ThemePref> {
  final Value<int> themeId;
  final Value<String> themeName;
  const ThemePrefsCompanion({
    this.themeId = const Value.absent(),
    this.themeName = const Value.absent(),
  });
  ThemePrefsCompanion.insert({
    @required int themeId,
    @required String themeName,
  })  : themeId = Value(themeId),
        themeName = Value(themeName);
  static Insertable<ThemePref> custom({
    Expression<int> themeId,
    Expression<String> themeName,
  }) {
    return RawValuesInsertable({
      if (themeId != null) 'theme_id': themeId,
      if (themeName != null) 'theme_name': themeName,
    });
  }

  ThemePrefsCompanion copyWith({Value<int> themeId, Value<String> themeName}) {
    return ThemePrefsCompanion(
      themeId: themeId ?? this.themeId,
      themeName: themeName ?? this.themeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (themeId.present) {
      map['theme_id'] = Variable<int>(themeId.value);
    }
    if (themeName.present) {
      map['theme_name'] = Variable<String>(themeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemePrefsCompanion(')
          ..write('themeId: $themeId, ')
          ..write('themeName: $themeName')
          ..write(')'))
        .toString();
  }
}

class $ThemePrefsTable extends ThemePrefs
    with TableInfo<$ThemePrefsTable, ThemePref> {
  final GeneratedDatabase _db;
  final String _alias;
  $ThemePrefsTable(this._db, [this._alias]);
  final VerificationMeta _themeIdMeta = const VerificationMeta('themeId');
  GeneratedColumn<int> _themeId;
  @override
  GeneratedColumn<int> get themeId =>
      _themeId ??= GeneratedColumn<int>('theme_id', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _themeNameMeta = const VerificationMeta('themeName');
  GeneratedColumn<String> _themeName;
  @override
  GeneratedColumn<String> get themeName =>
      _themeName ??= GeneratedColumn<String>('theme_name', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [themeId, themeName];
  @override
  String get aliasedName => _alias ?? 'theme_prefs';
  @override
  String get actualTableName => 'theme_prefs';
  @override
  VerificationContext validateIntegrity(Insertable<ThemePref> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('theme_id')) {
      context.handle(_themeIdMeta,
          themeId.isAcceptableOrUnknown(data['theme_id'], _themeIdMeta));
    } else if (isInserting) {
      context.missing(_themeIdMeta);
    }
    if (data.containsKey('theme_name')) {
      context.handle(_themeNameMeta,
          themeName.isAcceptableOrUnknown(data['theme_name'], _themeNameMeta));
    } else if (isInserting) {
      context.missing(_themeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ThemePref map(Map<String, dynamic> data, {String tablePrefix}) {
    return ThemePref.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ThemePrefsTable createAlias(String alias) {
    return $ThemePrefsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ThemePrefsTable _themePrefs;
  $ThemePrefsTable get themePrefs => _themePrefs ??= $ThemePrefsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [themePrefs];
}
