import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_profile.dart';

class UserProfileRepository {
  UserProfileRepository(this._db);

  final FirebaseFirestore _db;

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _db.collection('users').doc(uid);

  Stream<UserProfile?> watch(String uid) {
    return _doc(uid)
        .snapshots(includeMetadataChanges: true)
        .where((snap) => snap.exists || !snap.metadata.isFromCache)
        .map((snap) => snap.exists ? UserProfile.fromMap(snap.data()!) : null);
  }

  Future<void> create(UserProfile profile) {
    return _doc(profile.uid).set({
      ...profile.toMap(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> update({
    required String uid,
    required String fullName,
    required DateTime? dateOfBirth,
    required String countryCode,
    required String countryName,
  }) {
    return _doc(uid).update({
      'fullName': fullName,
      'dateOfBirth': dateOfBirth == null
          ? null
          : Timestamp.fromDate(dateOfBirth),
      'countryCode': countryCode,
      'countryName': countryName,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> delete(String uid) => _doc(uid).delete();
}
