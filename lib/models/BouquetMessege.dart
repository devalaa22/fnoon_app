import 'package:cloud_firestore/cloud_firestore.dart';

class BouquetMessage {
  final String documentId;
  final String title1;
  final String title2;
  final String title3;

  BouquetMessage({
    required this.documentId,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  // تحويل الكائن إلى Map
  Map<String, dynamic> toMap() {
    return {
      'title1': title1,
      'title2': title2,
      'title3': title3,
    };
  }

  // إنشاء كائن من DocumentSnapshot
  factory BouquetMessage.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return BouquetMessage(
      documentId: doc.id,
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
    );
  }

  // إنشاء كائن من JSON (Map)
  factory BouquetMessage.fromJson(Map<String, dynamic> json, {String? documentId}) {
    return BouquetMessage(
      documentId: documentId ?? '',
      title1: json['title1'] ?? '',
      title2: json['title2'] ?? '',
      title3: json['title3'] ?? '',
    );
  }

  // نسخ الكائن مع إمكانية تعديل أي خاصية
  BouquetMessage copyWith({
    String? documentId,
    String? title1,
    String? title2,
    String? title3,
  }) {
    return BouquetMessage(
      documentId: documentId ?? this.documentId,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
    );
  }
}
