import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/personal_info_controller.dart';
import 'package:nilay/ui/home/pages/profile_page.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class PersonalInfoScreen extends StatelessWidget {

  final _controller = Get.put(PersonalInfoController());

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
            GestureDetector(
              child: GetBuilder<PersonalInfoController>(builder: (controller) => Container(
                margin: EdgeInsetsDirectional.only(top: 60.h),
                padding: EdgeInsetsDirectional.all(2.5.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50.r),
                    border: Border.all(color: AppColors.colorAppMain)),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    controller.userProfile == null
                    ? CircleAvatar(
                      backgroundColor: AppColors.colorAppMain,
                      radius: 42.r,
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(50.r)
                          ),
                          child: CachedImage(
                              isLoading: false,
                              imageUrl: AppHelper.getCurrentUser()!.photo!)),
                    )
                    : CircleAvatar(
                      backgroundColor: AppColors.colorAppMain,
                      radius: 42.r,
                      backgroundImage: FileImage(File(controller.userProfile!.path)),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 10.r),
                      padding: EdgeInsetsDirectional.all(2.2.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(50.r)
                      ),
                      child: Container(
                        margin: EdgeInsetsDirectional.only(bottom: 0.r),
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: AppColors.colorAppMain,
                            borderRadius: BorderRadiusDirectional.circular(50.r)
                        ),
                        child: SvgPicture.asset('${Const.icons}icon_camera.svg', fit: BoxFit.scaleDown,),
                      ),
                    )
                  ],
                ),
              )),
              onTap: () => _controller.requestStoragePermission(),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, end: 20.w, top: 40.h),
              child: TextFormField(
                controller: _controller.usernameController,
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
                        text: "username", fontWeight: FontWeight.w400),
                    hintText: 'username'.tr,
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
                  start: 20.w, end: 20.w, top: 30.h),
              child: TextFormField(
                controller: _controller.fullNameController,
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
                  start: 20.w, end: 20.w, top: 30.h),
              child: TextFormField(
                controller: _controller.phoneController,
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
                  start: 20.w, end: 20.w, top: 30.h),
              child: TextFormField(
                controller: _controller.emailController,
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
                  fontWeight: FontWeight.w400,
                  click: () => _controller.updateProfile(context)),
            )
          ],
        ),
      ),
    );
  }
}
