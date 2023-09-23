import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/stores/cart_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/stores/cart/cart_orders_item.dart';
import 'package:nilay/widget/vendors/stores/cart/cart_stores_item.dart';

class CartOrdersScreen extends StatelessWidget {
  CartOrdersScreen({super.key});

  final _controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'orders', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 45.h,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r, bottom: 20.r),
              padding: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(12.r),
                  boxShadow: [
                    // TODO Offset(START, BOTTOM)
                    BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(child: AppText.medium(text: 'total', color: AppColors.colorTextMain, fontSize: 18.sp)),
                  AppText.medium(text: '800\$', color: AppColors.colorTextMain, fontSize: 18.sp),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (_, index) => CartOrdersItem()),
          ],
        ),
      ),
    );
  }
}
