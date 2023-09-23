import 'dart:ui';

import 'package:nilay/model/test/colors.dart';
import 'package:nilay/model/test/sizes.dart';

class Product {
  late String name;
  late String title;
  late String description;
  late String image;
  late int price;
  late List<ProductColor> colors;
  late List<ProductSize> sizes;
  late bool isFavorite;

  Product({required this.name,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.isFavorite});
}

// TODO 11 ===> 120
// TODO 5 ===> 170