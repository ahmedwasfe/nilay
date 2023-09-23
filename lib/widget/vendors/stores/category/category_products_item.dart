import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/stores/home_stores_controller.dart';
import 'package:nilay/controller/vendors/stores/store_controller.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/ui/vendors/stores/product/products_category_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';

class CategoryProductsItem extends StatelessWidget {

  final _controller = Get.put(StoreController());

  final Categories category;
  CategoryProductsItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (controller) => GestureDetector(
      child: Container(
          margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
          child: Column(
            children: [
              CircleCachedImage(imageUrl: category.image, radius: 32),
              SizedBox(height: 8.h),
              AppText.medium(text: category.name,
                  fontSize: 14.sp, fontWeight: FontWeight.w400),
              SizedBox(height: category.isSelected ? 5.h : 0),
              category.isSelected
                  ? Container(
                width: 55.w,
                height: 2.h,
                decoration: BoxDecoration(
                    color: AppColors.colorAppMain,
                    borderRadius: BorderRadiusDirectional.circular(20.r)
                ),
              )
                  : Container(),
            ],
          )),
      onTap: () {
        for(var category in controller.listCategories){
          category.isSelected = false;
        }
        category.isSelected = true;
        controller.update();
        Get.to(ProductsCategoryScreen(category: category));
      },
    ));
  }
}
