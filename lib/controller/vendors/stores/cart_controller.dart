import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class CartController extends GetxController{

  void showDeleteOrderSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
      width: double.infinity,
      height: 280.h,
          margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, bottom: 2.r),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20.r)
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: 22.r),
              child: AppText.medium(text: 'remove_from_orders', color: AppColors.colorBlack)),
          Container(
            width: double.infinity,
            height: 138.h,
            margin: EdgeInsetsDirectional.only(top: 10.r),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(14.r),
                // boxShadow: [
                //   // TODO Offset(START, BOTTOM)
                //   BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                // ]
            ),
            child: Container(
                margin: EdgeInsetsDirectional.only(start: 12.r, end: 16.r, top: 10.r, bottom: 10.r),
                child: Row(
                  children: [
                    Container(
                      width: 129.w,
                      height: 115.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8.r)
                      ),
                      child: CachedImage(imageUrl: Const.storeSlider5),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(start: 16.r, top: 4.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppText.medium(text: 'Short blouse', color: AppColors.colorAppMain, fontWeight: FontWeight.w400),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    AppText.medium(text: 'size', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                    SizedBox(width: 2.r),
                                    AppText.medium(text: 'M', color: AppColors.colorBlack, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                  ],
                                ),
                                SizedBox(width: 16.h),
                                Row(
                                  children: [
                                    AppText.medium(text: 'color', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                    SizedBox(width: 2.r),
                                    Container(
                                      width: 14.w,
                                      height: 14.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.colorAppMain,
                                          borderRadius: BorderRadiusDirectional.circular(50.r),
                                          boxShadow: [
                                            // TODO Offset(START, BOTTOM)
                                            BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                                          ]
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                AppText.medium(text: 'price', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                SizedBox(width: 4.r),
                                AppText.medium(text: '800', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r, top: 12.r),
            child: Row(
              children: [
                Expanded(
                  child: AppWidgets.CustomButton(
                      text: 'cancel',
                      width: 120.w,
                      height: 48.h,
                      isUpperCase: false,
                      background: AppColors.colorGray1,
                      borderColor: AppColors.colorGray1,
                      textColor: AppColors.colorAppMain,
                      fontWeight: FontWeight.w400,
                      radius: 40.r,
                      click: () => Navigator.pop(context)),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AppWidgets.CustomButton(
                      text: 'delete',
                      width: 120.w,
                      height: 48.h,
                      isUpperCase: false,
                      background: AppColors.colorErrorBG,
                      borderColor: AppColors.colorErrorBG,
                      textColor: AppColors.colorErrorText,
                      fontWeight: FontWeight.w400,
                      radius: 40.r,
                      click: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}