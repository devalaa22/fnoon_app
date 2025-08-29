import 'package:cloud_firestore/cloud_firestore.dart';

final String tableAllEvent = 'AllEvent';

class AllEventFields {
  static final List<String> values = [
    id, title, imageUrl, youtubUrl, state, actor, qute
  ];

  static const String id = 'id';
  static const String title = 'title';
  static const String imageUrl = 'image';
  static const String youtubUrl = 'youtubUrl';
  static const String state = 'state';
  static const String actor = 'actor';
  static const String qute = 'qute';
}

class AllEvent {
  final String documentId;
  final String title;
  final String imageUrl;
  final String youtubUrl;
  final String state;
  final String qute;
  final String actor;

  AllEvent({
    required this.documentId,
    required this.title,
    required this.imageUrl,
    required this.youtubUrl,
    required this.state,
    required this.qute,
    required this.actor,
  });

  // تحويل الكلاس إلى Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': imageUrl,
      'youtubUrl': youtubUrl,
      'state': state,
      'qute': qute,
      'actor': actor,
    };
  }

  // إنشاء كائن من DocumentSnapshot
  factory AllEvent.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return AllEvent(
      documentId: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['image'] ?? '',
      youtubUrl: data['youtubUrl'] ?? '',
      state: data['state'] ?? '',
      qute: data['qute'] ?? '',
      actor: data['actor'] ?? '',
    );
  }

  // إنشاء كائن من JSON (Map)
  factory AllEvent.fromJson(Map<String, dynamic> json) {
    return AllEvent(
      documentId: json['documentId'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      youtubUrl: json['youtubUrl'] ?? '',
      state: json['state'] ?? '',
      qute: json['qute'] ?? '',
      actor: json['actor'] ?? '',
    );
  }

  // نسخ الكائن مع إمكانية تعديل أي خاصية
  AllEvent copyWith({
    String? documentId,
    String? title,
    String? imageUrl,
    String? youtubUrl,
    String? state,
    String? qute,
    String? actor,
  }) {
    return AllEvent(
      documentId: documentId ?? this.documentId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      youtubUrl: youtubUrl ?? this.youtubUrl,
      state: state ?? this.state,
      qute: qute ?? this.qute,
      actor: actor ?? this.actor,
    );
  }
}
