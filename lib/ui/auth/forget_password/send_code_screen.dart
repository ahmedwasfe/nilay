import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/forget_password_controller.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/ui/auth/forget_password/verification_code_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class SendCodeScreen extends StatelessWidget {

  final _controller = Get.put(ForgetPasswordController());
  String? type;
  SendCodeScreen({this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        title: AppText.medium(text: 'forget_password', color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsetsDirectional.only(top: 20.r),
                child: SvgPicture.asset('${Const.images}image_forget_password2.svg')),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 50.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'forget_password', fontWeight: FontWeight.w500),
                  SizedBox(height: 16.h),
                  AppText.medium(text: type == Const.KEY_FORGET_EMAIL ? 'enter_email_to_reset_password' : 'enter_phone_to_reset_password',
                      fontWeight: FontWeight.w300, fontSize: 14.sp,
                      color: AppColors.colorTextSub3,
                      maxline: 2),
                ],
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 40.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: _controller.emailPhoneController,
                keyboardType: type == Const.KEY_FORGET_EMAIL ? TextInputType.emailAddress : TextInputType.phone,
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
                        text: type == Const.KEY_FORGET_EMAIL ? 'email' : 'phone', fontWeight: FontWeight.w400),
                    hintText: type == Const.KEY_FORGET_EMAIL ? 'example@example.com' : '+123 123 123 123',
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
                    suffixIcon: SvgPicture.asset(type == Const.KEY_FORGET_EMAIL ? '${Const.icons}icon_email.svg' : '${Const.icons}icon_phone.svg',
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, top: 100.r, end: 20.r),
              child: AppWidgets.CustomButton(
                  text: 'send',
                  radius: 50.r,
                  isUpperCase: false,
                  click: () {
                    if(_controller.isValidationEmailPhone(context, type!)){
                      Get.to(VerificationCodeScreen(type: type, emailPhone: _controller.emailPhoneController.text));
                    }
                  }),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 28.r),
              child: InkWell(
                child: AppText.medium(
                    text: 'back_signin',
                  fontWeight: FontWeight.w400,
                color: AppColors.colorAppMain,
                textDecoration: TextDecoration.underline,
                fontSize: 16.sp),
                onTap: () => Get.offAndToNamed(Routes.signIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
