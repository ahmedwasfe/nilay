
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/controller/vendors/stores/cart_controller.dart';
import 'package:nilay/model/test/store_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class CartOrdersItem extends StatelessWidget {

  CartOrdersItem({super.key});

  final _controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return _buildOrderItem(context);
  }

  Widget _buildOrderItem(BuildContext context) => Container(
    width: double.infinity,
    height: 138.h,
    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 20.r),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(14.r),
      boxShadow: [
        // TODO Offset(START, BOTTOM)
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
      ]
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
                    SizedBox(height: 12.h),
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
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        AppText.medium(text: 'price', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                        SizedBox(width: 2.r),
                        AppText.medium(text: '800\$', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            width: 50.w,
                            height: 22.h,
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
                            decoration: BoxDecoration(
                                color: AppColors.colorTextMain,
                                borderRadius: BorderRadiusDirectional.circular(20.r)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.medium(text: '-', fontWeight: FontWeight.w600, fontSize: 18.sp, color: AppColors.colorWhite),
                                AppText.medium(text: '1', color: AppColors.colorWhite, fontWeight: FontWeight.w400, fontSize: 18.sp),
                                AppText.medium(text: '+', fontWeight: FontWeight.w600, fontSize: 18.sp, color: AppColors.colorWhite),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                  child: SvgPicture.asset('${Const.icons}icon_delete_order.svg'),
              onTap: () {
                    _controller.showDeleteOrderSheet(context);
                    log("DELETE ORDER");
              }),
            )
          ],
        )),
  );
}