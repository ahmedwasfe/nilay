
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/model/test/store_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class VendorOrdersItem extends StatelessWidget {

  final Orders order;
  VendorOrdersItem({super.key, required this.order});

  final OrdersPageController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // print('ORDER: ${(order.image)}');
    return _buildOrderItem(context, order);
  }

  Widget _buildOrderItem(BuildContext context, Orders order) => Container(
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
        margin: EdgeInsetsDirectional.only(start: 18.r, end: 20.r, top: 18.r, bottom: 18.r),
        child: Row(
          children: [
            Container(
              width: 93.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8.r)
              ),
              child: CachedImage(imageUrl: order.image),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, top: 4.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppText.medium(text: order.name, color: AppColors.colorAppMain, fontWeight: FontWeight.w400),
                    SizedBox(height: 12.h),
                    order.vendorType == Const.KEY_VENDOR_STORE
                    ? Row(
                      children: [
                        Row(
                          children: [
                            AppText.medium(text: 'size', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 14.sp),
                            SizedBox(width: 2.r),
                            AppText.medium(text: order.size, color: AppColors.colorBlack, fontWeight: FontWeight.w400, fontSize: 14.sp),
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
                                  color: order.color,
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
                    )
                    : Column(
                      children: [
                        Row(
                          children: [
                            AppText.medium(text: 'date', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                            SizedBox(width: 2.r),
                            AppText.medium(text: order.date, color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            AppText.medium(text: 'time', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                            SizedBox(width: 2.r),
                            AppText.medium(text: order.time, color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    AppText.medium(text: order.price, color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                  ],
                ),
              ),
            ),
            GestureDetector(
                child: SvgPicture.asset('${Const.icons}icon_delete_order.svg'),
            onTap: () {
                  _controller.showDeleteOrderDialog(context, order);
                  log("DELETE ORDER");
            })
          ],
        )),
  );
}