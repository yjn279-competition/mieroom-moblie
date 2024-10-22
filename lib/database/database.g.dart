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

class $UserStatusesTable extends UserStatuses
    with TableInfo<$UserStatusesTable, UserStatuse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isInShelterMeta =
      const VerificationMeta('isInShelter');
  @override
  late final GeneratedColumn<bool> isInShelter = GeneratedColumn<bool>(
      'is_in_shelter', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_in_shelter" IN (0, 1))'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, status, isInShelter, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_statuses';
  @override
  VerificationContext validateIntegrity(Insertable<UserStatuse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_in_shelter')) {
      context.handle(
          _isInShelterMeta,
          isInShelter.isAcceptableOrUnknown(
              data['is_in_shelter']!, _isInShelterMeta));
    } else if (isInserting) {
      context.missing(_isInShelterMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserStatuse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStatuse(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      isInShelter: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_in_shelter'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $UserStatusesTable createAlias(String alias) {
    return $UserStatusesTable(attachedDatabase, alias);
  }
}

class UserStatuse extends DataClass implements Insertable<UserStatuse> {
  final int id;
  final String status;
  final bool isInShelter;
  final DateTime lastUpdated;
  const UserStatuse(
      {required this.id,
      required this.status,
      required this.isInShelter,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['status'] = Variable<String>(status);
    map['is_in_shelter'] = Variable<bool>(isInShelter);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  UserStatusesCompanion toCompanion(bool nullToAbsent) {
    return UserStatusesCompanion(
      id: Value(id),
      status: Value(status),
      isInShelter: Value(isInShelter),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory UserStatuse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStatuse(
      id: serializer.fromJson<int>(json['id']),
      status: serializer.fromJson<String>(json['status']),
      isInShelter: serializer.fromJson<bool>(json['isInShelter']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'status': serializer.toJson<String>(status),
      'isInShelter': serializer.toJson<bool>(isInShelter),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  UserStatuse copyWith(
          {int? id,
          String? status,
          bool? isInShelter,
          DateTime? lastUpdated}) =>
      UserStatuse(
        id: id ?? this.id,
        status: status ?? this.status,
        isInShelter: isInShelter ?? this.isInShelter,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  UserStatuse copyWithCompanion(UserStatusesCompanion data) {
    return UserStatuse(
      id: data.id.present ? data.id.value : this.id,
      status: data.status.present ? data.status.value : this.status,
      isInShelter:
          data.isInShelter.present ? data.isInShelter.value : this.isInShelter,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStatuse(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('isInShelter: $isInShelter, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, status, isInShelter, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStatuse &&
          other.id == this.id &&
          other.status == this.status &&
          other.isInShelter == this.isInShelter &&
          other.lastUpdated == this.lastUpdated);
}

class UserStatusesCompanion extends UpdateCompanion<UserStatuse> {
  final Value<int> id;
  final Value<String> status;
  final Value<bool> isInShelter;
  final Value<DateTime> lastUpdated;
  const UserStatusesCompanion({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.isInShelter = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  UserStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String status,
    required bool isInShelter,
    required DateTime lastUpdated,
  })  : status = Value(status),
        isInShelter = Value(isInShelter),
        lastUpdated = Value(lastUpdated);
  static Insertable<UserStatuse> custom({
    Expression<int>? id,
    Expression<String>? status,
    Expression<bool>? isInShelter,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (isInShelter != null) 'is_in_shelter': isInShelter,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  UserStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? status,
      Value<bool>? isInShelter,
      Value<DateTime>? lastUpdated}) {
    return UserStatusesCompanion(
      id: id ?? this.id,
      status: status ?? this.status,
      isInShelter: isInShelter ?? this.isInShelter,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isInShelter.present) {
      map['is_in_shelter'] = Variable<bool>(isInShelter.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStatusesCompanion(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('isInShelter: $isInShelter, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $UserStatusesTable userStatuses = $UserStatusesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profiles, userStatuses];
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
typedef $$UserStatusesTableCreateCompanionBuilder = UserStatusesCompanion
    Function({
  Value<int> id,
  required String status,
  required bool isInShelter,
  required DateTime lastUpdated,
});
typedef $$UserStatusesTableUpdateCompanionBuilder = UserStatusesCompanion
    Function({
  Value<int> id,
  Value<String> status,
  Value<bool> isInShelter,
  Value<DateTime> lastUpdated,
});

class $$UserStatusesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserStatusesTable> {
  $$UserStatusesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isInShelter => $state.composableBuilder(
      column: $state.table.isInShelter,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserStatusesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserStatusesTable> {
  $$UserStatusesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isInShelter => $state.composableBuilder(
      column: $state.table.isInShelter,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUpdated => $state.composableBuilder(
      column: $state.table.lastUpdated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserStatusesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserStatusesTable,
    UserStatuse,
    $$UserStatusesTableFilterComposer,
    $$UserStatusesTableOrderingComposer,
    $$UserStatusesTableCreateCompanionBuilder,
    $$UserStatusesTableUpdateCompanionBuilder,
    (
      UserStatuse,
      BaseReferences<_$AppDatabase, $UserStatusesTable, UserStatuse>
    ),
    UserStatuse,
    PrefetchHooks Function()> {
  $$UserStatusesTableTableManager(_$AppDatabase db, $UserStatusesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserStatusesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserStatusesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> isInShelter = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              UserStatusesCompanion(
            id: id,
            status: status,
            isInShelter: isInShelter,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String status,
            required bool isInShelter,
            required DateTime lastUpdated,
          }) =>
              UserStatusesCompanion.insert(
            id: id,
            status: status,
            isInShelter: isInShelter,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserStatusesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserStatusesTable,
    UserStatuse,
    $$UserStatusesTableFilterComposer,
    $$UserStatusesTableOrderingComposer,
    $$UserStatusesTableCreateCompanionBuilder,
    $$UserStatusesTableUpdateCompanionBuilder,
    (
      UserStatuse,
      BaseReferences<_$AppDatabase, $UserStatusesTable, UserStatuse>
    ),
    UserStatuse,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$UserStatusesTableTableManager get userStatuses =>
      $$UserStatusesTableTableManager(_db, _db.userStatuses);
}
