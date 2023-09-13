import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/forget_password_controller.dart';
import 'package:nilay/model/select_email_phone.dart';
import 'package:nilay/ui/auth/forget_password/send_code_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class SelectEmailPhoneScreen extends GetView<ForgetPasswordController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        title: AppText.medium(text: 'forget_password'),
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
                child: SvgPicture.asset('${Const.images}image_forget_password1.svg')),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 50.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'forget_password', fontWeight: FontWeight.w500),
                  SizedBox(height: 16.h),
                  AppText.medium(text: 'select_which_contact_details',
                  fontWeight: FontWeight.w300, fontSize: 14.sp,
                  color: AppColors.colorTextSub3,
                  maxline: 2),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.selectEmailPhone.length,
                itemBuilder: (_, index) => buildSelectEmailPhoneItem(controller.selectEmailPhone[index])),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, top: 40.r, end: 20.r),
              child: Obx(() => AppWidgets.CustomButton(
                  text: 'next',
                  textColor: controller.isEnable.isTrue ? AppColors.colorWhite : AppColors.colorBtnTextDisable,
                  background: controller.isEnable.isTrue ? AppColors.colorAppMain : AppColors.colorBtnDisable,
                  borderColor: controller.isEnable.isTrue ? AppColors.colorAppMain : AppColors.colorBtnDisable,
                  radius: 50.r,
                  isEnable: controller.isEnable.value,
                  isUpperCase: false,
                  click: () {
                    if(controller.isEnable.isTrue){
                     Get.to(SendCodeScreen(type: controller.type));
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSelectEmailPhoneItem(SelectEmailPhone selectEmailPhone) => GetBuilder<ForgetPasswordController>(builder: (controller) => InkWell(
    child: Container(
      margin: EdgeInsetsDirectional.only(top: 20.r, start: 20.r, end: 20.r),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: selectEmailPhone.isSelected ? AppColors.coloSelectEmailPhoneBG : AppColors.colorWhite,
          borderRadius: BorderRadiusDirectional.circular(24.r),
          border: Border.all(color: selectEmailPhone.isSelected ? AppColors.coloSelectEmailPhoneBG : AppColors.colorTextSub2)
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 20.r),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: selectEmailPhone.isSelected ? AppColors.coloSelectEmailPhoneIconBG : AppColors.colorOtherBG,
                  borderRadius: BorderRadiusDirectional.circular(18.r)
              ),
              child: SvgPicture.asset('${Const.icons}${selectEmailPhone.icon}',
                  color: selectEmailPhone.isSelected ? AppColors.colorWhite : AppColors.colorAppMain,
                  fit: BoxFit.scaleDown),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.medium(text: selectEmailPhone.title,
                      color: AppColors.colorTextSub3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 4.h),
                  AppText.medium(text: selectEmailPhone.content,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    onTap: () {
      for(SelectEmailPhone select in controller.selectEmailPhone){
        select.isSelected = false;
      }
      selectEmailPhone.isSelected = true;
      controller.isEnable(true);
      controller.type = selectEmailPhone.type;
      controller.update();
    },
  ));
}
