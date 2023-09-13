import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/forget_password_controller.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class NewPasswordScreen extends StatelessWidget {

  final _controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        title: AppText.medium(text: 'create_new_password', color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
            child: AppText.medium(text: 'create_secure_password',
                fontWeight: FontWeight.w300, fontSize: 14.sp,
                color: AppColors.colorTextSub3,
                maxline: 2),
          ),
          Container(
            margin:
            EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
            child: GetBuilder<ForgetPasswordController>(
                builder: (controller) => TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: AppColors.colorAppMain,
                  cursorWidth: 1.3.w,
                  cursorRadius: const Radius.circular(32).r,
                  obscureText: controller.isVisiblePass,
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
          Container(
            margin:
            EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
            child: GetBuilder<ForgetPasswordController>(
                builder: (controller) => TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: controller.confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: AppColors.colorAppMain,
                  cursorWidth: 1.3.w,
                  cursorRadius: const Radius.circular(32).r,
                  obscureText: controller.isVisibleConfirmPass,
                  enabled: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontFamily: Const.appFont,
                      color: Colors.black),
                  decoration: InputDecoration(
                      label: AppText.medium(
                          text: 'confirm_password',
                          fontWeight: FontWeight.w400),
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
                              '${Const.icons}${controller.visibleConfirmPassIcon}',
                              fit: BoxFit.scaleDown),
                          onTap: () =>
                              controller.visibleConfirmPassword())),
                )),
          ),
          Spacer(),
          Container(
            margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, bottom: 50.r),
            child: AppWidgets.CustomButton(
                text: 'confirm',
                radius: 50.r,
                isUpperCase: false,
                click: () {
                  if(_controller.isValidationPassword(context)){
                    Get.toNamed(Routes.congratulations);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
