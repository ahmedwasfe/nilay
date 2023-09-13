import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/signin_controller.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class SignInScreen extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 80.w,
                height: 80.h,
                margin: EdgeInsetsDirectional.only(top: 120.r),
                child: Image.asset('${Const.images}logo.png')),
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(start: 20.r),
                      height: 55.h,
                      child: Card(
                        margin: EdgeInsetsDirectional.zero,
                        elevation: 2.r,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(28.r),
                                bottomStart: Radius.circular(28.r))),
                        child: InkWell(
                          child: Container(
                            child: Align(
                                // alignment: AlignmentDirectional.center,
                                child: AppText.medium(
                                    text: 'sign_up'.tr.tr,
                                    color: AppColors.colorAppMain,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp)),
                          ),
                          onTap: () => Get.toNamed(Routes.signUp),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(end: 20.r),
                      height: 55.h,
                      child: Card(
                        margin: EdgeInsetsDirectional.zero,
                        elevation: 2.r,
                        color: AppColors.colorAppMain,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(28.r),
                                bottomEnd: Radius.circular(28.r))),
                        child: Align(
                            // alignment: AlignmentDirectional.center,
                            child: AppText.medium(
                                text: 'sign_in'.tr.tr,
                                color: AppColors.colorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: const Radius.circular(32).r,
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    label: AppText.medium(
                        text: 'phone', fontWeight: FontWeight.w400),
                    hintText: '+123 123 123 123',
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGray, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.colorBlack, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 48.h,
                      minWidth: 48.w,
                    ),
                    suffixIcon: SvgPicture.asset('${Const.icons}icon_phone.svg',
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
              child: GetBuilder<SignInController>(
                  builder: (controller) => TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: AppColors.colorAppMain,
                        cursorWidth: 1.3.w,
                        obscureText: controller.isVisiblePass,
                        cursorRadius: const Radius.circular(32).r,
                        enabled: true,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: Const.appFont,
                            color: Colors.black),
                        decoration: InputDecoration(
                            label: AppText.medium(
                                text: 'password', fontWeight: FontWeight.w400),
                            hintText: '***************',
                            hintStyle: TextStyle(
                                color: AppColors.colorTextSub2,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400),
                            fillColor: const Color(0xffFFFFFF),
                            filled: true,
                            helperMaxLines: 1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGray, width: 0.2.w),
                              borderRadius: BorderRadius.circular(32).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.colorBlack, width: 0.2.w),
                              borderRadius: BorderRadius.circular(32).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 48.h,
                              minWidth: 48.w,
                            ),
                            suffixIcon: InkWell(
                                child: SvgPicture.asset(
                                    '${Const.icons}${controller.visiblePassIcon}',
                                    fit: BoxFit.scaleDown),
                                onTap: () => controller.visiblePassword())),
                      )),
            ),
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                  child: Container(
                      margin: EdgeInsetsDirectional.only(end: 28.r, top: 12.r),
                      child: AppText.medium(
                          text: 'forget_password!',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp)),
                  onTap: () => Get.toNamed(Routes.selectEmailPhone),
                )),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
              child: AppWidgets.CustomButton(
                  text: 'signin'.tr,
                  radius: 50.r,
                  isUpperCase: false,
                  click: () {
                    if (controller.isValidation(context)) {
                      controller.login();
                    }
                  }),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(top: 28.r),
                child: AppText.medium(
                    text: 'or', fontWeight: FontWeight.w400, fontSize: 16.sp)),
            Container(
              margin: EdgeInsetsDirectional.only(top: 28.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                        child:
                            SvgPicture.asset('${Const.icons}icon_google.svg')),
                    onTap: () => controller.googleSignIn(),
                  ),
                  InkWell(
                    child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                        child: SvgPicture.asset(
                            '${Const.icons}icon_facebook.svg')),
                    onTap: () => controller.facebookLogin(),
                  ),
                  InkWell(
                    child: Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                        child:
                            SvgPicture.asset('${Const.icons}icon_apple.svg')),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
