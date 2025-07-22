import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profileImage;
  final DateTime createdAt;
  final DateTime lastLogin;
  final String deviceToken;
  final DateTime updatedAt;
  final bool isAdmin;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.createdAt,
    required this.lastLogin,
    required this.deviceToken,
    required this.updatedAt,
    this.isAdmin = false,
  });

  /// Convert Firestore document to UserModel
  factory UserModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return UserModel(
      uid: data['uid'] ?? documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImage: data['profileImage'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastLogin: (data['lastLogin'] as Timestamp?)?.toDate() ?? DateTime.now(),
      deviceToken: data['deviceToken'] ?? '',
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isAdmin: (data['isAdmin'] as bool?) ?? false,
    );
  }

  /// Convert UserModel to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'createdAt': createdAt,
      'lastLogin': lastLogin,
      'deviceToken': deviceToken,
      'updatedAt': updatedAt,
      'isAdmin': isAdmin,
    };
  }
}
