import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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

@DriftDatabase(tables: [Profiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
