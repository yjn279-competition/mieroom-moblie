import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../models/profile.dart' as profile_model;

final databaseProvider = Provider((ref) => AppDatabase());

final profilesProvider =
    FutureProvider<List<profile_model.Profile>>((ref) async {
  final database = ref.watch(databaseProvider);
  final profiles = await database.getAllProfiles();
  return profiles
      .map((p) => profile_model.Profile(
            id: p.id,
            name: p.name,
            birthDate: p.birthDate,
            gender: p.gender,
            myNumber: p.myNumber,
            familyNumbers: p.familyNumbers.split(','),
            specialNotes: p.specialNotes,
          ))
      .toList();
});

final profileProvider =
    FutureProvider.family<profile_model.Profile, int>((ref, id) async {
  final database = ref.watch(databaseProvider);
  final profile = await database.getProfile(id);
  return profile_model.Profile(
    id: profile.id,
    name: profile.name,
    birthDate: profile.birthDate,
    gender: profile.gender,
    myNumber: profile.myNumber,
    familyNumbers: profile.familyNumbers.split(','),
    specialNotes: profile.specialNotes,
  );
});
