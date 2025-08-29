import 'package:cloud_firestore/cloud_firestore.dart';

class ImagePickerModel {
  final String documentId;
  final String imageUrl; // رابط الصورة من Firebase Storage

  ImagePickerModel({
    required this.documentId,
    required this.imageUrl,
  });

  // تحويل الكائن إلى Map
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  // إنشاء كائن من DocumentSnapshot
  factory ImagePickerModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return ImagePickerModel(
      documentId: doc.id,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  // إنشاء نسخة معدلة من الكائن
  ImagePickerModel copyWith({
    String? documentId,
    String? imageUrl,
  }) {
    return ImagePickerModel(
      documentId: documentId ?? this.documentId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
