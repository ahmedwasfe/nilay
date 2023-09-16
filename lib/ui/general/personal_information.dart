import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/ui/home/pages/profile_page.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(
          text: 'my_profile',
          color: AppColors.colorAppMain,
        ),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Get.to(ProfilePage()),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 92.w,
                height: 92.h,
                padding: EdgeInsetsDirectional.all(2.r),
                margin: EdgeInsetsDirectional.only(top: 64.h, bottom: 40.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50.r),
                    border: Border.all(color: AppColors.colorAppMain)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  backgroundImage:
                      NetworkImage(AppHelper.getCurrentUser()!.photo!),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, end: 20.w, bottom: 30.h),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: Radius.circular(32.r),
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    label: AppText.medium(
                        text: "user_name", fontWeight: FontWeight.w400),
                    hintText: 'user_name'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    helperMaxLines: 1,
                    filled: true,
                    fillColor: AppColors.colorWhite,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightGray, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.colorBlack, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    // constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 48.w),
                    suffixIcon: SvgPicture.asset(
                      "${Const.icons}icon_profile_user_name.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, end: 20.w, bottom: 30.h),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: Radius.circular(32.r),
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    label: AppText.medium(
                        text: 'full_name', fontWeight: FontWeight.w400),
                    hintText: 'full_name'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    helperMaxLines: 1,
                    filled: true,
                    fillColor: AppColors.colorWhite,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightGray, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.colorBlack, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    // constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 48.w),
                    suffixIcon: SvgPicture.asset(
                      "${Const.icons}icon_profile_user_name.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, end: 20.w, bottom: 30.h),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: Radius.circular(32.r),
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    label: AppText.medium(
                        text: "phone", fontWeight: FontWeight.w400),
                    hintText: 'phone'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    helperMaxLines: 1,
                    filled: true,
                    fillColor: AppColors.colorWhite,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightGray, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.colorBlack, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    // constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 48.w),
                    suffixIcon: SvgPicture.asset(
                      "${Const.icons}icon_profile_phone.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, end: 20.w, bottom: 30.h),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: Radius.circular(32.r),
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    label: AppText.medium(
                        text: "email", fontWeight: FontWeight.w400),
                    hintText: 'email'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    helperMaxLines: 1,
                    filled: true,
                    fillColor: AppColors.colorWhite,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightGray, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.colorBlack, width: 0.2.w),
                        borderRadius: BorderRadius.circular(32.r)),
                    // constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 48.w),
                    suffixIcon: SvgPicture.asset(
                      "${Const.icons}icon_email.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 56.h, bottom: 40.h),
              child: AppWidgets.CustomButton(
                  text: 'save',
                  width: 350.w,
                  height: 48.h,
                  radius: 24.r,
                  textColor: AppColors.colorWhite,
                  background: AppColors.colorAppMain,
                  borderColor: AppColors.colorAppMain,
                  isUpperCase: false,
                  // fontfamily: Const.appFont,
                  fontWeight: FontWeight.w400,
                  click: () {}),
            )
          ],
        ),
      ),
    );
  }
}
