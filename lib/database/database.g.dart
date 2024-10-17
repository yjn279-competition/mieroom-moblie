// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<String> birthDate = GeneratedColumn<String>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _myNumberMeta =
      const VerificationMeta('myNumber');
  @override
  late final GeneratedColumn<String> myNumber = GeneratedColumn<String>(
      'my_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _familyNumbersMeta =
      const VerificationMeta('familyNumbers');
  @override
  late final GeneratedColumn<String> familyNumbers = GeneratedColumn<String>(
      'family_numbers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _specialNotesMeta =
      const VerificationMeta('specialNotes');
  @override
  late final GeneratedColumn<String> specialNotes = GeneratedColumn<String>(
      'special_notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, birthDate, gender, myNumber, familyNumbers, specialNotes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<Profile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('my_number')) {
      context.handle(_myNumberMeta,
          myNumber.isAcceptableOrUnknown(data['my_number']!, _myNumberMeta));
    } else if (isInserting) {
      context.missing(_myNumberMeta);
    }
    if (data.containsKey('family_numbers')) {
      context.handle(
          _familyNumbersMeta,
          familyNumbers.isAcceptableOrUnknown(
              data['family_numbers']!, _familyNumbersMeta));
    } else if (isInserting) {
      context.missing(_familyNumbersMeta);
    }
    if (data.containsKey('special_notes')) {
      context.handle(
          _specialNotesMeta,
          specialNotes.isAcceptableOrUnknown(
              data['special_notes']!, _specialNotesMeta));
    } else if (isInserting) {
      context.missing(_specialNotesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birth_date'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      myNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}my_number'])!,
      familyNumbers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}family_numbers'])!,
      specialNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}special_notes'])!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String name;
  final String birthDate;
  final String gender;
  final String myNumber;
  final String familyNumbers;
  final String specialNotes;
  const Profile(
      {required this.id,
      required this.name,
      required this.birthDate,
      required this.gender,
      required this.myNumber,
      required this.familyNumbers,
      required this.specialNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['birth_date'] = Variable<String>(birthDate);
    map['gender'] = Variable<String>(gender);
    map['my_number'] = Variable<String>(myNumber);
    map['family_numbers'] = Variable<String>(familyNumbers);
    map['special_notes'] = Variable<String>(specialNotes);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      name: Value(name),
      birthDate: Value(birthDate),
      gender: Value(gender),
      myNumber: Value(myNumber),
      familyNumbers: Value(familyNumbers),
      specialNotes: Value(specialNotes),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      birthDate: serializer.fromJson<String>(json['birthDate']),
      gender: serializer.fromJson<String>(json['gender']),
      myNumber: serializer.fromJson<String>(json['myNumber']),
      familyNumbers: serializer.fromJson<String>(json['familyNumbers']),
      specialNotes: serializer.fromJson<String>(json['specialNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'birthDate': serializer.toJson<String>(birthDate),
      'gender': serializer.toJson<String>(gender),
      'myNumber': serializer.toJson<String>(myNumber),
      'familyNumbers': serializer.toJson<String>(familyNumbers),
      'specialNotes': serializer.toJson<String>(specialNotes),
    };
  }

  Profile copyWith(
          {int? id,
          String? name,
          String? birthDate,
          String? gender,
          String? myNumber,
          String? familyNumbers,
          String? specialNotes}) =>
      Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        myNumber: myNumber ?? this.myNumber,
        familyNumbers: familyNumbers ?? this.familyNumbers,
        specialNotes: specialNotes ?? this.specialNotes,
      );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      gender: data.gender.present ? data.gender.value : this.gender,
      myNumber: data.myNumber.present ? data.myNumber.value : this.myNumber,
      familyNumbers: data.familyNumbers.present
          ? data.familyNumbers.value
          : this.familyNumbers,
      specialNotes: data.specialNotes.present
          ? data.specialNotes.value
          : this.specialNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('myNumber: $myNumber, ')
          ..write('familyNumbers: $familyNumbers, ')
          ..write('specialNotes: $specialNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, birthDate, gender, myNumber, familyNumbers, specialNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.birthDate == this.birthDate &&
          other.gender == this.gender &&
          other.myNumber == this.myNumber &&
          other.familyNumbers == this.familyNumbers &&
          other.specialNotes == this.specialNotes);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> birthDate;
  final Value<String> gender;
  final Value<String> myNumber;
  final Value<String> familyNumbers;
  final Value<String> specialNotes;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.gender = const Value.absent(),
    this.myNumber = const Value.absent(),
    this.familyNumbers = const Value.absent(),
    this.specialNotes = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String birthDate,
    required String gender,
    required String myNumber,
    required String familyNumbers,
    required String specialNotes,
  })  : name = Value(name),
        birthDate = Value(birthDate),
        gender = Value(gender),
        myNumber = Value(myNumber),
        familyNumbers = Value(familyNumbers),
        specialNotes = Value(specialNotes);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? birthDate,
    Expression<String>? gender,
    Expression<String>? myNumber,
    Expression<String>? familyNumbers,
    Expression<String>? specialNotes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (birthDate != null) 'birth_date': birthDate,
      if (gender != null) 'gender': gender,
      if (myNumber != null) 'my_number': myNumber,
      if (familyNumbers != null) 'family_numbers': familyNumbers,
      if (specialNotes != null) 'special_notes': specialNotes,
    });
  }

  ProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? birthDate,
      Value<String>? gender,
      Value<String>? myNumber,
      Value<String>? familyNumbers,
      Value<String>? specialNotes}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      myNumber: myNumber ?? this.myNumber,
      familyNumbers: familyNumbers ?? this.familyNumbers,
      specialNotes: specialNotes ?? this.specialNotes,
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
    if (birthDate.present) {
      map['birth_date'] = Variable<String>(birthDate.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (myNumber.present) {
      map['my_number'] = Variable<String>(myNumber.value);
    }
    if (familyNumbers.present) {
      map['family_numbers'] = Variable<String>(familyNumbers.value);
    }
    if (specialNotes.present) {
      map['special_notes'] = Variable<String>(specialNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('myNumber: $myNumber, ')
          ..write('familyNumbers: $familyNumbers, ')
          ..write('specialNotes: $specialNotes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profiles];
}

typedef $$ProfilesTableCreateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  required String name,
  required String birthDate,
  required String gender,
  required String myNumber,
  required String familyNumbers,
  required String specialNotes,
});
typedef $$ProfilesTableUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> birthDate,
  Value<String> gender,
  Value<String> myNumber,
  Value<String> familyNumbers,
  Value<String> specialNotes,
});

class $$ProfilesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get birthDate => $state.composableBuilder(
      column: $state.table.birthDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get myNumber => $state.composableBuilder(
      column: $state.table.myNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get familyNumbers => $state.composableBuilder(
      column: $state.table.familyNumbers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get specialNotes => $state.composableBuilder(
      column: $state.table.specialNotes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProfilesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get birthDate => $state.composableBuilder(
      column: $state.table.birthDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get myNumber => $state.composableBuilder(
      column: $state.table.myNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get familyNumbers => $state.composableBuilder(
      column: $state.table.familyNumbers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get specialNotes => $state.composableBuilder(
      column: $state.table.specialNotes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfilesTable,
    Profile,
    $$ProfilesTableFilterComposer,
    $$ProfilesTableOrderingComposer,
    $$ProfilesTableCreateCompanionBuilder,
    $$ProfilesTableUpdateCompanionBuilder,
    (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
    Profile,
    PrefetchHooks Function()> {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProfilesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProfilesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> birthDate = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<String> myNumber = const Value.absent(),
            Value<String> familyNumbers = const Value.absent(),
            Value<String> specialNotes = const Value.absent(),
          }) =>
              ProfilesCompanion(
            id: id,
            name: name,
            birthDate: birthDate,
            gender: gender,
            myNumber: myNumber,
            familyNumbers: familyNumbers,
            specialNotes: specialNotes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String birthDate,
            required String gender,
            required String myNumber,
            required String familyNumbers,
            required String specialNotes,
          }) =>
              ProfilesCompanion.insert(
            id: id,
            name: name,
            birthDate: birthDate,
            gender: gender,
            myNumber: myNumber,
            familyNumbers: familyNumbers,
            specialNotes: specialNotes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProfilesTable,
    Profile,
    $$ProfilesTableFilterComposer,
    $$ProfilesTableOrderingComposer,
    $$ProfilesTableCreateCompanionBuilder,
    $$ProfilesTableUpdateCompanionBuilder,
    (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
    Profile,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
}
