import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/add_address_controller.dart';
import 'package:nilay/model/add_address.dart';
import 'package:nilay/ui/general/address_page.dart';
import 'package:nilay/utils/app_color.dart';

import '../../utils/app_helper.dart';
import '../../utils/app_text.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';

class AddAdressScreen extends StatelessWidget {
  final controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(
          text: 'address',
          color: AppColors.colorAppSub2,
        ),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Get.to(AddressPage()),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 24.r),
            child: GetBuilder<AddAddressController>(builder: (controller) {
              return DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      AppText.medium(
                        text: controller.governorateSelected.value.isNotEmpty
                            ? controller.governorateSelected.value
                            : 'governorate'.tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColorBg,
                      ),
                    ],
                  ),
                  items: controller.listAddress
                      .map((addresses) => DropdownMenuItem<AddAddress>(
                            value: addresses,
                            child: AppText.medium(
                              text: addresses.governorate.tr,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorAppMain,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.governorateSelected.value = value!.governorate;
                    controller.governorateId = value.governorateId;
                    controller.update();
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
                  buttonPadding:
                      EdgeInsetsDirectional.only(start: 18.r, end: 18.r),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AppColors.colorAppSub),
                      color: Colors.white),
                  itemHeight: 42.h,
                  dropdownMaxHeight: 250.h,
                  dropdownWidth: 200.w,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: AppColors.colorAppSub),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarThickness: 1.r,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(10, 0),
                ),
              );
            }),
          ),
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
            child: GetBuilder<AddAddressController>(builder: (controller) {
              return DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      AppText.medium(
                        text: controller.regoinSelected.value.isNotEmpty
                            ? controller.regoinSelected.value
                            : 'region'.tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColorBg,
                      ),
                    ],
                  ),
                  items: controller.listAddress
                      .map((addresses) => DropdownMenuItem<AddAddress>(
                            value: addresses,
                            child: AppText.medium(
                              text: addresses.region.tr,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorAppMain,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.regoinSelected.value = value!.region;
                    controller.regoinId = value.regionId;
                    controller.update();
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
                  buttonPadding:
                      EdgeInsetsDirectional.only(start: 18.r, end: 18.r),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AppColors.colorAppSub),
                      color: Colors.white),
                  itemHeight: 42.h,
                  dropdownMaxHeight: 250.h,
                  dropdownWidth: 200.w,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: AppColors.colorAppSub),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarThickness: 1.r,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(10, 0),
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 24.h),
            child: TextField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.colorAppMain,
              cursorWidth: 1.3.w,
              cursorRadius: Radius.circular(32.r),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: Const.appFont,
                color: AppColors.grayColorBg,
              ),
              decoration: InputDecoration(
                hintText: 'street'.tr,
                hintStyle: TextStyle(
                    color: AppColors.colorTextSub2,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400),
                helperMaxLines: 1,
                filled: true,
                fillColor: AppColors.colorWhite,
                enabled: true,
                constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 335.w),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide:
                        BorderSide(width: 1, color: AppColors.colorAppSub)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide:
                        BorderSide(width: 1, color: AppColors.colorAppSub)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 24.h),
            child: TextField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.colorAppMain,
              cursorWidth: 1.3.w,
              cursorRadius: Radius.circular(32.r),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.grayColorBg),
              decoration: InputDecoration(
                hintText: 'house_number'.tr,
                hintStyle: TextStyle(
                    color: AppColors.colorTextSub2,
                    fontFamily: Const.appFont,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400),
                helperMaxLines: 1,
                filled: true,
                fillColor: AppColors.colorWhite,
                enabled: true,
                constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 335.w),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide:
                        BorderSide(width: 1, color: AppColors.colorAppSub)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide:
                        BorderSide(width: 1, color: AppColors.colorAppSub)),
              ),
            ),
          ),
          Container(
              margin:
                  EdgeInsetsDirectional.only(start: 24.r, end: 24.r, top: 48.r),
              child: AppWidgets.CustomButton(
                  text: 'Save',
                  radius: 48.r,
                  isUpperCase: false,
                  click: () {
                    if (controller.isValidation(context)) {
                      Get.to(AddressPage());
                    }
                  }))
        ],
      ),
    );
  }
}
