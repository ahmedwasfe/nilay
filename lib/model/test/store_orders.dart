import 'package:flutter/material.dart';

class Orders {
  final String image;
  final String name;
  final String size;
  final Color color;
  final String date;
  final String time;
  final String price;
  final String vendorType;

  Orders({
    required this.image,
    required this.name,
    required this.size,
    required this.color,
    required this.date,
    required this.time,
    required this.price,
    required this.vendorType});
}