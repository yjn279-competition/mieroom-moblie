import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mieroom/models/user_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get birthDate => text()();
  TextColumn get gender => text()();
  TextColumn get myNumber => text()();
  TextColumn get familyNumbers => text()();
  TextColumn get specialNotes => text()();
}

class UserStatuses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get status => text()();
  BoolColumn get isInShelter => boolean()();
  DateTimeColumn get lastUpdated => dateTime()();
}

@DriftDatabase(tables: [Profiles, UserStatuses])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static final AppDatabase _instance = AppDatabase._();

  static AppDatabase get instance => _instance;

  @override
  int get schemaVersion => 1;

  Future<List<Profile>> getAllProfiles() => select(profiles).get();
  Future<Profile> getProfile(int id) =>
      (select(profiles)..where((t) => t.id.equals(id))).getSingle();
  Future<int> insertProfile(ProfilesCompanion profile) =>
      into(profiles).insert(profile);
  Future<bool> updateProfile(ProfilesCompanion profile) =>
      update(profiles).replace(profile);
  Future<int> deleteProfile(int id) =>
      (delete(profiles)..where((t) => t.id.equals(id))).go();

  Future<UserStatus?> getUserStatus() async {
    final result = await (select(userStatuses)..limit(1)).getSingleOrNull();
    if (result != null) {
      return UserStatus(
        id: result.id,
        status: result.status,
        isInShelter: result.isInShelter,
        lastUpdated: result.lastUpdated,
      );
    }
    return null;
  }

  Future<int> insertOrUpdateUserStatus(UserStatusesCompanion userStatus) async {
    final existingStatus =
        await (select(userStatuses)..limit(1)).getSingleOrNull();
    if (existingStatus != null) {
      return (update(userStatuses)
            ..where((t) => t.id.equals(existingStatus.id)))
          .write(userStatus);
    } else {
      return into(userStatuses).insert(userStatus);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
