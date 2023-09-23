import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class CartStoreItem extends StatelessWidget {
  const CartStoreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: _buildCartItem(),
    onTap: () => Get.toNamed(Routes.cartOrders));
  }

  Widget _buildCartItem() => Container(
    width: double.infinity,
    height: 136.h,
    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 15.r, bottom: 16.r),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(14.r),
        boxShadow: [
          // TODO Offset(START, BOTTOM)
          BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
        ]
    ),
    child: Row(
      children: [
        Container(
          width: 129.w,
          height: 115.h,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsetsDirectional.only(start: 12.r, top: 10.r, bottom: 10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r)
          ),
          child: CachedImage(imageUrl: Const.storesHomeSlider1),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText.medium(text: 'Karmen Store', fontWeight: FontWeight.w400),
                Row(
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.h,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: AppColors.colorAppSub3,
                          borderRadius: BorderRadiusDirectional.circular(50.r)
                      ),
                      child: AppText.medium(text: '8', color: AppColors.colorWhite, fontWeight: FontWeight.w400, fontSize: 14.r),
                    ),
                    SizedBox(width: 4.h),
                    AppText.medium(text: 'orders', fontWeight: FontWeight.w400)
                  ],
                ),
                Row(
                  children: [
                    AppText.medium(text: 'total', fontWeight: FontWeight.w400),
                    SizedBox(width: 4.h),
                    AppText.medium(text: '800\$', fontWeight: FontWeight.w400)
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(50.r)
          ),
          margin: EdgeInsetsDirectional.only(end: 20.r),
          child: Container(
            width: 14.w,
            height: 14.h,
            margin: EdgeInsetsDirectional.all(8.r),
            child: SvgPicture.asset(AppHelper.iconArrow(),
              width: 14.w,
              height: 14.h,
            ),
          ),
        )
      ],
    ),
  );
}
