import 'package:flutter/material.dart';

class TypeOfGridview {
  final String imageUrl;       // رابط الصورة أو مسارها
  final String title;          // العنوان الظاهر
  final VoidCallback function; // دالة عند الضغط

  // الكونستركتور الصحيح بدون أي باراميتر مكرر
  TypeOfGridview({
    required this.imageUrl,
    required this.title,
    required this.function,
  });
}

