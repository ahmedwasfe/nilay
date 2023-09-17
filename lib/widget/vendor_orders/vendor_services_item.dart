import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/ui/orders/vendors_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';

class VendorServicesItem extends StatelessWidget {

  final VendorsOrders vendor;
  const VendorServicesItem({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return _buildVendorsItem(vendor);
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
    onTap: () => Get.to(VendorsScreen(vendor: vendor)),
  );
}
