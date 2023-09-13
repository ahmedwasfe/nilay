import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class CongratulationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: 200.r),
              child: SvgPicture.asset('${Const.images}image_congratulations.svg')),
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 50.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText.medium(text: 'congratulations', fontWeight: FontWeight.w500),
                SizedBox(height: 8.h),
                AppText.medium(text: 'account_ready_use',
                    fontWeight: FontWeight.w300, fontSize: 14.sp,
                    color: AppColors.colorTextSub3,
                    maxline: 1),
                AppText.medium(text: 'signin_enjoy_features',
                    fontWeight: FontWeight.w300, fontSize: 14.sp,
                    color: AppColors.colorTextSub3,
                    maxline: 1),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin:
            EdgeInsetsDirectional.only(start: 20.r, end: 20.r, bottom: 50.r),
            child: AppWidgets.CustomButton(
                text: 'signin'.tr,
                radius: 50.r,
                isUpperCase: false,
                click: () {
                  Get.offAndToNamed(Routes.signIn);
                }),
          ),
        ],
      ),
    );
  }
}
