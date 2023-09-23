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
import 'package:nilay/utils/constants.dart';

class ProductBestSellerItem extends StatelessWidget {
  final Product product;
  const ProductBestSellerItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: _buildProductItem(product),
    onTap: () => Get.to(ProductDetailsScreen(product: product)));
  }

  Widget _buildProductItem(Product product) => Container(
    width: 320.w,
    height: 158.h,
    margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorPinBG1),
        borderRadius: BorderRadiusDirectional.circular(10.r)
    ),
    child: Row(
      children: [
        Container(
          width: 150.w,
          height: 150.h,
          margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, top: 4.r, bottom: 4.r),
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
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsetsDirectional.only(start: 4.r),
                    child: AppText.medium(text: product.title, fontWeight: FontWeight.w400, fontSize: 12.sp)),
                SizedBox(height: 8.h),
                AppText.medium(text: product.name, fontWeight: FontWeight.w400, fontSize: 16.sp),
                SizedBox(height: 12.h),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 4.r, start: 4.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.medium(text: '${product.price}\$', color: AppColors.colorAppMain),
                      SizedBox(height: 8.h),
                      Container(
                        width: 84.w,
                        height: 24.h,
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
                        decoration: BoxDecoration(
                            color: AppColors.colorAppMain,
                            borderRadius: BorderRadiusDirectional.circular(6.r)
                        ),
                        child: AppText.medium(text: 'details', color: AppColors.colorWhite, fontWeight: FontWeight.w400, fontSize: 14.sp),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
