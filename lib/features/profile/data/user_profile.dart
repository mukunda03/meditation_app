import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  const UserProfile({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.countryCode,
    required this.countryName,
    required this.profileCompleted,
    this.dateOfBirth,
  });

  final String uid;
  final String email;
  final String fullName;
  final DateTime? dateOfBirth;
  final String countryCode;
  final String countryName;
  final bool profileCompleted;

  String get initials {
    final letters = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0]);
    final initials = letters.join().toUpperCase();
    return initials.isEmpty ? '?' : initials;
  }

  factory UserProfile.fromMap(Map<String, dynamic> data) {
    return UserProfile(
      uid: data['uid'] as String? ?? '',
      email: data['email'] as String? ?? '',
      fullName: data['fullName'] as String? ?? '',
      dateOfBirth: (data['dateOfBirth'] as Timestamp?)?.toDate(),
      countryCode: data['countryCode'] as String? ?? 'IN',
      countryName: data['countryName'] as String? ?? 'India',
      profileCompleted: data['profileCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth == null
          ? null
          : Timestamp.fromDate(dateOfBirth!),
      'countryCode': countryCode,
      'countryName': countryName,
      'profileCompleted': profileCompleted,
    };
  }
}
