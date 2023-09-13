import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';

class VendorOrdersScreen extends StatelessWidget {

  final _controller = Get.put(OrdersPageController());

  VendorsOrders? vendor;
  VendorOrdersScreen({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: vendor!.name, color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: _controller.listVendors.length,
          itemBuilder: (_, index) => _buildVendorsItem(_controller.listVendors[index])),
    );
  }

  Widget _buildVendorsItem(VendorsOrders vendor) => Container(
    width: double.infinity,
    height: 113.h,
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
              width: 114.w,
              height: 96.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.amber,
                  borderRadius: BorderRadiusDirectional.circular(24.r)
              ),
              child: Image.network(vendor.image, fit: BoxFit.cover,)),
          Expanded(
            child: Container(
                margin: EdgeInsetsDirectional.only(start: 18.r),
                child: AppText.medium(text: 'Karmen Store', color: AppColors.colorAppMain)),
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
  );
}