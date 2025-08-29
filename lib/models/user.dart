import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  final String id;
  final String email;
  final String password;
  final String role;

  UserInfoModel({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
  });

  // تحويل الكائن إلى Map
  Map<String, dynamic> toMap() {
    return {
      "userId": id,
      "email": email,
      "password": password,
      "role": role,
    };
  }

  // إنشاء الكائن من Firestore DocumentSnapshot
  factory UserInfoModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserInfoModel(
      id: doc.id,
      email: data["Email"] ?? '',
      password: data["password"] ?? '',
      role: data["role"] ?? '',
    );
  }

  // إنشاء نسخة معدلة من الكائن
  UserInfoModel copyWith({
    String? id,
    String? email,
    String? password,
    String? role,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }
}
