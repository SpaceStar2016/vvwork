// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DBWordTable extends DBWord with TableInfo<$DBWordTable, DBWordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBWordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, word, translation, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'd_b_word';
  @override
  VerificationContext validateIntegrity(Insertable<DBWordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_translationMeta,
          translation.isAcceptableOrUnknown(data['body']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBWordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBWordData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
    );
  }

  @override
  $DBWordTable createAlias(String alias) {
    return $DBWordTable(attachedDatabase, alias);
  }
}

class DBWordData extends DataClass implements Insertable<DBWordData> {
  final int id;
  final String word;
  final String translation;
  final int? category;
  const DBWordData(
      {required this.id,
      required this.word,
      required this.translation,
      this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['body'] = Variable<String>(translation);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    return map;
  }

  DBWordCompanion toCompanion(bool nullToAbsent) {
    return DBWordCompanion(
      id: Value(id),
      word: Value(word),
      translation: Value(translation),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory DBWordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBWordData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      translation: serializer.fromJson<String>(json['translation']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'translation': serializer.toJson<String>(translation),
      'category': serializer.toJson<int?>(category),
    };
  }

  DBWordData copyWith(
          {int? id,
          String? word,
          String? translation,
          Value<int?> category = const Value.absent()}) =>
      DBWordData(
        id: id ?? this.id,
        word: word ?? this.word,
        translation: translation ?? this.translation,
        category: category.present ? category.value : this.category,
      );
  @override
  String toString() {
    return (StringBuffer('DBWordData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, translation, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBWordData &&
          other.id == this.id &&
          other.word == this.word &&
          other.translation == this.translation &&
          other.category == this.category);
}

class DBWordCompanion extends UpdateCompanion<DBWordData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> translation;
  final Value<int?> category;
  const DBWordCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.translation = const Value.absent(),
    this.category = const Value.absent(),
  });
  DBWordCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String translation,
    this.category = const Value.absent(),
  })  : word = Value(word),
        translation = Value(translation);
  static Insertable<DBWordData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? translation,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (translation != null) 'body': translation,
      if (category != null) 'category': category,
    });
  }

  DBWordCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? translation,
      Value<int?>? category}) {
    return DBWordCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (translation.present) {
      map['body'] = Variable<String>(translation.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBWordCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DBWordTable dBWord = $DBWordTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBWord];
}
