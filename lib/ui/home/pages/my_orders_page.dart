import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/home_controller.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/widget/vendor_orders/vendor_services_item.dart';

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
        toolbarHeight: 60.h,
        leading: InkWell(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 20.r),
            child: CircleCachedImage(imageUrl: AppHelper.getCurrentUser()!.photo!, isLoading: false),
          ),
          onTap: () {
            HomeController controller = Get.find();
            controller.getCurrentNavIndex(navIndex: 2);
          },
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
          itemBuilder: (_, index) => VendorServicesItem(vendor: _controller.listVendorsOrders[index])),
    );
  }
}
