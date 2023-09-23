import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/model/test/colors.dart';
import 'package:nilay/model/test/product_type.dart';
import 'package:nilay/model/test/rating.dart';
import 'package:nilay/model/test/sales.dart';
import 'package:nilay/model/test/sizes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/constants.dart';

class FilterController extends GetxController {

  RangeValues currentRangeValues = const RangeValues(10, 80);

  int categorySelected = 0;
  int productCategorySelected = 0;
  int ratingSelected = 0;
  bool isOnline = false;
  bool isNearbyPlaces = false;

  // TODO ALL STORES

  List<Categories> listCategories = [
    Categories(id: 1, name: 'Clothes', image: Const.storesHomeCategory1, isSelected: false),
    Categories(id: 2, name: 'Makeup', image: Const.storesHomeCategory2, isSelected: false),
    Categories(id: 3, name: 'Accessories', image: Const.storesHomeCategory3, isSelected: false),
    Categories(id: 4, name: 'Skin care', image: Const.storesHomeCategory4, isSelected: false),
    Categories(id: 5, name: 'hygiene ', image: Const.storesHomeCategory5, isSelected: false),
  ];
  
  List<Sales> listSales = [
    Sales(name: '20 %', isSelected: false),
    Sales(name: '30 %', isSelected: false),
    Sales(name: '40 %', isSelected: false),
    Sales(name: '50 %', isSelected: false),
    Sales(name: '60 %', isSelected: false),
    Sales(name: '70 %', isSelected: false),
    Sales(name: '80 %', isSelected: false),
  ];

  List<Rating> listRating = [
    Rating(id: 1, name: '1-2', isSelected: false),
    Rating(id: 2, name: '2-3', isSelected: false),
    Rating(id: 3, name: '3-4', isSelected: false),
    Rating(id: 4, name: '4-5', isSelected: false),
  ];

  // TODO ALL PRODUCTS

  List<Categories> listProductsCategories = [
    Categories(id: 1, name: 'Fashions', image: Const.imageFashions, isSelected: false),
    Categories(id: 2, name: 'Bottoms', image: Const.imageBottoms, isSelected: false),
    Categories(id: 3, name: 'Swimwear', image: Const.imageSwimwear, isSelected: false),
    Categories(id: 4, name: 'Dress', image: Const.imageDress, isSelected: false),
    Categories(id: 5, name: 'Plus size', image: Const.imagePlusSize, isSelected: false),
  ];

  List<ProductType> listProductType = [
    ProductType(name: 'new_arrival', isSelected: false),
    ProductType(name: 'best_seller', isSelected: false),
    ProductType(name: 'most_popular', isSelected: false),
  ];

  List<ProductSize> listProductSizes = [
    ProductSize(size: 'XS', isSelected: false),
    ProductSize(size: 'S', isSelected: false),
    ProductSize(size: 'M', isSelected: false),
    ProductSize(size: 'L', isSelected: false),
    ProductSize(size: 'XL', isSelected: false),
    ProductSize(size: 'XXL', isSelected: false),
    ProductSize(size: 'XXXL', isSelected: false),
  ];

  List<ProductColor> listProductColors = <ProductColor>[
    ProductColor(color: AppColors.colorAppMain, isSeleced: false),
    ProductColor(color: AppColors.colorTextSub, isSeleced: false),
    ProductColor(color: AppColors.colorErrorBG, isSeleced: false),
    ProductColor(color: AppColors.colorTextSub2, isSeleced: false),
    ProductColor(color: AppColors.colorOtherText, isSeleced: false),
    ProductColor(color: AppColors.colorTextSub5, isSeleced: false),
    ProductColor(color: AppColors.colorBoarding2, isSeleced: false),
    ProductColor(color: AppColors.colorTextUnSelected, isSeleced: true),
    ProductColor(color: AppColors.lightRed, isSeleced: false),
    ProductColor(color: AppColors.colorSuccessBG1, isSeleced: false),
    ProductColor(color: AppColors.coloSelectEmailPhoneIconBG, isSeleced: false),
    ProductColor(color: AppColors.colorGray1, isSeleced: false),
    ProductColor(color: AppColors.colorSnackBaErrorColor, isSeleced: false),
    ProductColor(color: AppColors.colorLine, isSeleced: false),
    ProductColor(color: AppColors.colorSuccessBG, isSeleced: false),
    ProductColor(color: AppColors.colorAppSub2, isSeleced: false),
    ProductColor(color: AppColors.lightBlue, isSeleced: false),
    ProductColor(color: AppColors.lightYellow, isSeleced: false),


  ];

}