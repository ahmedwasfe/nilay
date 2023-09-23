import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/product.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';

class ProductDetailsController extends GetxController {

  RxInt quantity = 1.obs;
  Color colorSelcted = Colors.white;
  String sizeSelected = '';
  int total = 0;

  void increment(int price) {
    quantity.value++;
    total = price * quantity.value;
    log('TOTAL: $total');
    update();
  }

  void decrement(int price) {
    if (quantity.value == 1) {
      return;
    } else {
      quantity--;
      total = price * quantity.value;
      log('TOTAL: $total');
    }
    update();
  }

  void showProductDetailsBottomSheet(BuildContext context, {required Product product}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
          margin: EdgeInsetsDirectional.only(start: 0.r, end: 0.r, bottom: 2.r),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20.r)
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 25.r, start: 20.r, end: 20.r),
                  child: AppText.medium(text: product.name,
                      color: AppColors.colorAppMain,
                      fontSize: 18.sp),
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 16.r, start: 20.r, end: 20.r),
                    child: AppText.medium(text: product.description,
                        maxline: 3,
                        color: AppColors.colorTextSub3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
                _buildDivider(),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                  child: Row(
                    children: [
                      AppText.medium(text: 'color', color: AppColors.colorAppMain),
                      Container(
                        width: 18.r,
                        height: 18.r,
                        margin: EdgeInsetsDirectional.only(start: 50.r, end: 5.r),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.colorAppMain),
                          borderRadius: BorderRadiusDirectional.circular(50.r),
                        ),
                        padding: EdgeInsets.all(1.5.r),
                        child: Container(
                          width: 14.r,
                          height: 14.r,
                          decoration: BoxDecoration(
                              color: colorSelcted,
                              borderRadius: BorderRadiusDirectional.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4.r),
                                    blurRadius: 4.r, offset: Offset(0.1.r, 0.1.r)
                                )
                              ]
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                _buildDivider(),
                Container(
                  margin: EdgeInsetsDirectional.only( start: 20.r, end: 20.r),
                  child: Row(
                    children: [
                      AppText.medium(text: 'size', color: AppColors.colorAppMain),
                      Container(
                        width: 28.r,
                        height: 45.r,
                        margin: EdgeInsetsDirectional.only(start: 60.r, end: 3.5.r, bottom: 2.r),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: AppColors.colorTextSub7,
                            borderRadius: BorderRadiusDirectional.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 4.r, offset: const Offset(0.1, 0.1)
                              )
                            ]
                        ),
                        child: AppText.medium(text: sizeSelected, fontSize: 14.sp, fontWeight: FontWeight.w500,
                            color: AppColors.colorWhite),
                      )

                    ],
                  ),
                ),
                _buildDivider(),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                  child: Row(
                    children: [
                      AppText.medium(text: 'quantity', color: AppColors.colorAppMain),
                      Container(
                        width: 28.r,
                        height: 45.r,
                        margin: EdgeInsetsDirectional.only(start: 32.r, end: 3.5.r, bottom: 2.r),
                        alignment: AlignmentDirectional.center,
                        child: AppText.medium(text: quantity.value.toString(), fontSize: 16.sp, fontWeight: FontWeight.w500,
                            color: AppColors.colorAppMain),
                      )

                    ],
                  ),
                ),
                _buildDivider(),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                  child: Row(
                    children: [
                      AppText.medium(text: 'total', color: AppColors.colorAppMain),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 60.r, end: 3.5.r, bottom: 2.r),
                        alignment: AlignmentDirectional.center,
                        child: AppText.medium(text: '$total\$', fontSize: 16.sp, fontWeight: FontWeight.w500,
                            color: AppColors.colorAppMain),
                      )

                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                    margin: EdgeInsetsDirectional.only(top: 40.r, bottom: 20.r),
                    child: AppWidgets.CustomButton(
                        text: 'confirmation',
                        width: 175.w,
                        height: 42.h,
                        radius: 20.r,
                        isUpperCase: false,
                        click: () => Get.toNamed(Routes.homeStores)))
              ],
            ),
          ),
        ));
  }

  Widget _buildDivider() => Container(
    margin: EdgeInsetsDirectional.only(top: 30.r, bottom: 20.r),
    child: const Divider(color: Colors.grey)
  );
}