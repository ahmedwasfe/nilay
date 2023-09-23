import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/product.dart';
import 'package:nilay/ui/vendors/stores/product/product_details_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: _buildProductItem(product),
    onTap: () => Get.to(ProductDetailsScreen(product: product)));
  }

  Widget _buildProductItem(Product product) => Container(
    width: 155.w,
    height: 243.h,
    margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorPinBG1),
        borderRadius: BorderRadiusDirectional.circular(10.r)
    ),
    child: Column(
      children: [
        Container(
          width: 147.w,
          height: 131.h,
          margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, top: 4.r),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8.r)
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CachedImage(imageUrl: product.image),
              Container(
                  width: 20.r,
                  height: 20.r,
                  margin: EdgeInsetsDirectional.only(top: 6.r, end: 6.r),
                  padding: EdgeInsetsDirectional.all(4.r),
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius:
                      BorderRadiusDirectional.circular(50.r)),
                  child: SvgPicture.asset(
                      AppHelper.isFavorite(product.isFavorite))),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 12.r),
          child: Column(
            children: [
              AppText.medium(text: product.name, fontWeight: FontWeight.w400),
              SizedBox(height: 8.h),
              Container(
                margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                child: AppText.medium(text: product.description,
                    maxline: 2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400, fontSize: 10.r),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 14.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText.medium(text: '${product.price}\$', color: AppColors.colorAppMain),
                    AppText.medium(text: 'details', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
