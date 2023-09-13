import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/settings_controller.dart';
import 'package:nilay/model/country.dart';
import 'package:nilay/model/language.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class LanguageScreen extends StatelessWidget {
  final _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('${Const.images}logo.png'),
            Container(
              margin: EdgeInsetsDirectional.only(start: 24.r, end: 24.r, top: 40.r),
              child: GetBuilder<SettingsController>(builder: (controller) => DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: AppText.medium(
                    text: controller.countrySelected_.value.isNotEmpty ? controller.countrySelected_.value.tr : 'select_your_country'.tr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorAppMain,
                  ),
                  items: controller.listCountries.map((country) => DropdownMenuItem<Country>(
                    value: country,
                    child: Row(
                      children: [
                        AppText.medium(text:
                          country.name.tr,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: country.isSelected ? AppColors.colorAppMain : AppColors.colorBlack,
                        ),
                        const Spacer(),
                        SvgPicture.asset('${Const.flags}${country.flag}')
                      ],
                    ),
                  )).toList(),
                  onChanged: (value) {
                    for(Country country in controller.listCountries){
                      country.isSelected = false;
                    }
                    value!.isSelected = true;
                    controller.countrySelected_.value = value.name;
                    controller.flagSelected.value = value.flag;
                    controller.countrySelectedId = value.id;
                    print('Country Id: ${controller.countrySelectedId}');
                    controller.update();
                    _controller.update();
                  },
                  icon: controller.flagSelected.value.isEmpty ? Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28.r,
                    color: AppColors.colorAppMain,
                  ) : SvgPicture.asset('${Const.flags}${controller.flagSelected.value}'),
                  iconSize: 14.sp,
                  iconEnabledColor: AppColors.colorBlack,
                  iconDisabledColor: AppColors.colorBlack,
                  buttonHeight: 50.h,
                  buttonWidth: double.infinity,
                  buttonPadding: EdgeInsetsDirectional.only(start: 18.r, end: 18.r),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AppColors.colorAppMain),
                      color: Colors.white),
                  itemHeight: 42.h,
                  dropdownMaxHeight: 250.h,
                  dropdownWidth: 200.w,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: AppColors.colorAppMain),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarThickness: 1.r,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(10, 0),
                ),
              )),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 24.r, end: 24.r, top: 40.r),
              child: GetBuilder<SettingsController>(builder: (controller) => DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      controller.languageSelected.value.isNotEmpty ? SvgPicture.asset('${Const.icons}icon_lang_check.svg') : Container(),
                      controller.languageSelected.value.isNotEmpty ? SizedBox(width: 12.r) : Container(),
                      AppText.medium(
                        text: controller.languageSelected.value.isNotEmpty ? controller.languageSelected.value : 'select_your_language'.tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorAppMain,
                      ),
                    ],
                  ),
                  items: controller.listLanguages.map((lang) => DropdownMenuItem<Language>(
                    value: lang,
                    child: Row(
                      children: [
                        SvgPicture.asset('${Const.icons}icon_lang_uncheck.svg'),
                        SizedBox(width: 12.r),
                        AppText.medium(text:
                        lang.languageName.tr,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: lang.isSelected ? AppColors.colorAppMain : AppColors.colorBlack,
                        ),
                      ],
                    ),
                  )).toList(),
                  onChanged: (value) {
                    for(Language lang in controller.listLanguages){
                      lang.isSelected = false;
                    }
                    value!.isSelected = true;
                    controller.languageSelected.value = value.languageName;
                    controller.saveLanguage(value.languageCode);
                    controller.update();
                    _controller.update();
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28.r,
                    color: AppColors.colorAppMain,
                  ),
                  iconSize: 14.sp,
                  iconEnabledColor: AppColors.colorBlack,
                  iconDisabledColor: AppColors.colorBlack,
                  buttonHeight: 50.h,
                  buttonWidth: double.infinity,
                  buttonPadding: EdgeInsetsDirectional.only(start: 18.r, end: 18.r),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AppColors.colorAppMain),
                      color: Colors.white),
                  itemHeight: 42.h,
                  dropdownMaxHeight: 250.h,
                  dropdownWidth: 200.w,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: AppColors.colorAppMain),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarThickness: 1.r,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(10, 0),
                ),
              )),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 24.r, end: 24.r, top: 48.r),
                child: AppWidgets.CustomButton(
                    text: 'next',
                    radius: 48.r,
                    isUpperCase: false,
                    click: () {
                      if(_controller.isValidation(context)) {
                        Get.toNamed(Routes.boarding);
                      }

                    }))
          ],
        ),
      ),
    );
  }
}
