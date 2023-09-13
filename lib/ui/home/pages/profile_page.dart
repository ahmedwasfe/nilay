import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title:
            AppText.medium(text: 'my_profile', color: AppColors.colorAppMain),
        centerTitle: true,
        /*leading: Container(
          margin: EdgeInsetsDirectional.only(start: 12.r),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            backgroundImage: NetworkImage(AppHelper.getCurrentUser()!.photo!),
          ),
        ),*/
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: Stack(
              // alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                    width: 24.w, height: 24.h, AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)),
                  child: AppText.medium(
                      text: '8',
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 38.r, start: 20.r),
              child: Row(
                children: [
                  Container(
                    width: 65.w,
                    height: 65.h,
                    padding: EdgeInsetsDirectional.all(2.r),
                    margin: EdgeInsetsDirectional.only(start: 12.r),
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
                  Expanded(
                    child: Container(
                        margin: EdgeInsetsDirectional.only(start: 16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: AppHelper.getCurrentUser()!.name!,
                                fontWeight: FontWeight.w400),
                            SizedBox(height: 4.r),
                            AppText.medium(
                                text: AppHelper.getCurrentUser()!.email!,
                                color: AppColors.colorTextSub5,
                                fontWeight: FontWeight.w300),
                            SizedBox(height: 4.r),
                            GestureDetector(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_edit_profile.svg'),
                                  SizedBox(width: 4.w),
                                  AppText.medium(
                                      text: 'edit_profile',
                                      color: AppColors.colorAppSub2,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      textDecoration: TextDecoration.underline),
                                ],
                              ),
                              onTap: () {
                                print('EDIT');
                              },
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 38.r, start: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(
                      text: 'general', color: AppColors.colorTextSub6),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    margin: EdgeInsetsDirectional.only(top: 20.r, end: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('${Const.icons}icon_person_info.svg'),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppText.medium(
                            text: 'personal_information',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SvgPicture.asset(AppHelper.iconArrow())
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    margin: EdgeInsetsDirectional.only(top: 24.r, end: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('${Const.icons}icon_address.svg'),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppText.medium(
                            text: 'address',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SvgPicture.asset(AppHelper.iconArrow())
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    margin: EdgeInsetsDirectional.only(top: 24.r, end: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('${Const.icons}icon_favorites.svg'),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppText.medium(
                            text: 'favorites',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SvgPicture.asset(AppHelper.iconArrow())
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    margin: EdgeInsetsDirectional.only(top: 24.r, end: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset('${Const.icons}icon_wallet.svg'),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppText.medium(
                            text: 'e-wallet',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SvgPicture.asset(AppHelper.iconArrow())
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    margin: EdgeInsetsDirectional.only(top: 24.r, end: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            '${Const.icons}icon_payment_methods.svg'),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: AppText.medium(
                            text: 'payment_methods',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SvgPicture.asset(AppHelper.iconArrow())
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 38.r),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: 'settings',
                                color: AppColors.colorTextSub6),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_notifications.svg'),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                      text: 'notifications',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_language.svg'),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                      text: 'languages',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                          ])),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 38.r),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: 'help_center',
                                color: AppColors.colorTextSub6),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_faq.svg'),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                      text: 'faq',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_contact_us.svg'),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                      text: 'contact_us',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      '${Const.icons}icon_privacy_policy.svg'),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                      text: 'privacy_policy',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.r),
                              margin: EdgeInsetsDirectional.only(
                                  top: 24.r, end: 20.r),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppHelper.iconLogout()),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: AppText.medium(
                                        text: 'logout',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: AppColors.colorErrorText),
                                  ),
                                  SvgPicture.asset(AppHelper.iconArrow())
                                ],
                              ),
                            ),
                          ])),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 56.h, bottom: 40.h),
                    child: AppWidgets.CustomButton(
                        text: 'delete_account',
                        width: 350.w,
                        height: 48.h,
                        radius: 24.r,
                        textColor: AppColors.colorErrorText,
                        background: AppColors.colorErrorBG,
                        borderColor: AppColors.colorErrorBG,
                        isUpperCase: false,
                        // fontfamily: Const.appFont,
                        fontWeight: FontWeight.w400,
                        click: () {
                          PreferencesManager.clearData(
                              key: Const.KEY_USER_DATA);
                          PreferencesManager.clearData(
                              key: Const.KEY_USER_TOKEN);
                          Get.toNamed(Routes.signIn);
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
