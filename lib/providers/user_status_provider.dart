import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_status.dart';
import '../database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;

class UserStatusNotifier extends StateNotifier<UserStatus?> {
  final AppDatabase _db = AppDatabase.instance;

  UserStatusNotifier() : super(null) {
    _loadUserStatus();
  }

  Future<void> _loadUserStatus() async {
    final userStatus = await _db.getUserStatus();
    state = userStatus;
    debugPrint('Loaded user status: $userStatus');
  }

  Future<void> updateUserStatus(String newStatus, bool isInShelter) async {
    debugPrint('Updating user status: $newStatus, isInShelter: $isInShelter');
    final userStatus = UserStatusesCompanion(
      status: drift.Value(newStatus),
      isInShelter: drift.Value(isInShelter),
      lastUpdated: drift.Value(DateTime.now()),
    );
    await _db.insertOrUpdateUserStatus(userStatus);
    await _loadUserStatus();
    debugPrint(
        'Updated user status: ${state?.status}, isInShelter: ${state?.isInShelter}');
  }
}

final userStatusProvider =
    StateNotifierProvider<UserStatusNotifier, UserStatus?>((ref) {
  return UserStatusNotifier();
});
