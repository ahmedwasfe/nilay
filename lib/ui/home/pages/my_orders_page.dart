import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/ui/orders/orders_vendor_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class MyOrdersPage extends StatelessWidget {

  final _controller = Get.put(OrdersPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'my_orders', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 20.r),
          child: CircleAvatar(
            backgroundColor: AppColors.colorAppMain,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(100.r)
              ),
              child: CachedImage(
                isLoading: false,
                  fit: BoxFit.scaleDown,
                  imageUrl: AppHelper.getCurrentUser()!.photo!),
            ),
          ),
        ),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: Stack(
              // alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                    width: 24.w,
                    height: 24.h,
                    AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)
                  ),
                  child: AppText.medium(text: '8',
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.listVendorsOrders.length,
          itemBuilder: (_, index) => _buildVendorsItem(_controller.listVendorsOrders[index])),
    );
  }

  Widget _buildVendorsItem(VendorsOrders vendor) => GestureDetector(
    child: Container(
      width: double.infinity,
      height: 80.h,
      margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 20.r),
      child: Card(
        margin: EdgeInsetsDirectional.zero,
        elevation: 2.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(24.r)
        ),
        child: Row(
          children: [
            Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, top: 12.r, bottom: 12.r),
                width: 80.w,
                height: 70.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12.r)
                ),
                child: CachedImage(imageUrl: vendor.image)),
            Expanded(
              child: Container(
                  margin: EdgeInsetsDirectional.only(start: 32.r),
                  child: AppText.medium(text: vendor.name, color: AppColors.colorAppMain)),
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
      ),
    ),
    onTap: () => Get.to(VendorOrdersScreen(vendor: vendor)),
  );
}
