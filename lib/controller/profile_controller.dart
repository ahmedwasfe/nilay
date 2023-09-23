import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class ProfileController extends GetxController {

  final controller = ValueNotifier<bool>(false);
  bool checked = false;


  void showAccountBottomSheet(BuildContext context, {required String title, required String message, required String type}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
          height: 200.h,
          margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, bottom: 2.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(20.r)
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsetsDirectional.only(top: 22.r),
                  child: AppText.medium(text: title, color: AppColors.colorAppMain)),
              Container(
                  margin: EdgeInsetsDirectional.only(top: 20.r),
                  child: AppText.medium(text: message,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.colorTextSub6)),
              Container(
                  margin: EdgeInsetsDirectional.only(top: 2.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.medium(text: AppHelper.getCurrentUser()!.name!,
                          fontSize: 14.sp,
                          color: AppColors.colorBlack),
                      SizedBox(width: 4.w),
                      AppText.medium(text: 'account',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.colorTextSub6),
                    ],
                  )),
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 25.r),
                child: Row(
                  children: [
                    Expanded(
                      child: AppWidgets.CustomButton(
                          text: 'cancel',
                          width: 120.w,
                          height: 48.h,
                          isUpperCase: false,
                          background: AppColors.colorGray1,
                          borderColor: AppColors.colorGray1,
                          textColor: AppColors.colorAppMain,
                          fontWeight: FontWeight.w400,
                          radius: 40.r,
                          click: () => Navigator.pop(context)),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppWidgets.CustomButton(
                          text: type == Const.KEY_SHEET_LOGOUT ? 'logout' : 'delete',
                          width: 120.w,
                          height: 48.h,
                          isUpperCase: false,
                          background: AppColors.colorErrorBG,
                          borderColor: AppColors.colorErrorBG,
                          textColor: AppColors.colorErrorText,
                          fontWeight: FontWeight.w400,
                          radius: 40.r,
                          click: () {
                            if(type == Const.KEY_SHEET_LOGOUT) {
                              logout();
                            } else {
                              deleteAccount();
                            }
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void logout() {
    PreferencesManager.clearData(
        key: Const.KEY_USER_DATA);
    PreferencesManager.clearData(
        key: Const.KEY_USER_TOKEN);
    Get.toNamed(Routes.signIn);
  }

  void deleteAccount() {
    PreferencesManager.clearData(
        key: Const.KEY_USER_DATA);
    PreferencesManager.clearData(
        key: Const.KEY_USER_TOKEN);
    Get.toNamed(Routes.signIn);
  }

}