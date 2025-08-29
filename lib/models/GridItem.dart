import 'package:flutter/material.dart';

class GridItem {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  GridItem({
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });
}
