import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/ui/vendors/beauty_centers/beauty_center_screen.dart';
import 'package:nilay/ui/vendors/stores/store_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class TopFiveCentersItem extends StatelessWidget {

  final VendorData vendor;

  const TopFiveCentersItem({required this.vendor, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: _buildTopFavoriteItem(vendor),
        onTap: () => Get.to(BeautyCenterScreen(vendor: vendor)));
  }

  Widget _buildTopFavoriteItem(VendorData vendor) => Container(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
    width: 272.w,
    height: 159.r,
    decoration: BoxDecoration(
      // color: Colors.transparent.withOpacity(0.5),
        borderRadius: BorderRadiusDirectional.circular(9.r)),
    child: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        CachedImage(imageUrl: vendor.image),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: 150,
            height: 30.h,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(
                bottom: 16.r, start: 10.r, end: 10.r),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadiusDirectional.circular(10.r)),
            child: AppText.medium(
                text: vendor.name,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.colorAppMain),
          ),
        ),
        Container(
          width: 272.w,
          height: 159.r,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(60),
          ),
        ),
        Container(
          height: 48.r,
          // color: Colors.cyan,
          margin:
          EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                  AppHelper.getVenderMembership(vendor.membership, false)),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    top: 10.5,
                    right: 0,
                    child: SvgPicture.asset(
                        height: 10, '${Const.icons}icon_shape_polygon.svg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 35.r,
                        height: 18.r,
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius:
                            BorderRadiusDirectional.circular(16.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('${Const.icons}icon_star.svg'),
                            AppText.medium(
                                text: vendor.rate,
                                color: AppColors.colorAppMain,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                      ),
                      Container(
                          width: 20.r,
                          height: 20.r,
                          margin: EdgeInsetsDirectional.only(top: 7.r),
                          padding: EdgeInsetsDirectional.all(4.r),
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius:
                              BorderRadiusDirectional.circular(50.r)),
                          child: SvgPicture.asset(
                              AppHelper.isFavorite(vendor.isFavorite))),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
