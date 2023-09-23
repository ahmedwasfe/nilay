import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/address_controller.dart';
import 'package:nilay/model/test/add_address.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class AddAddressScreen extends StatelessWidget {
  final controller = Get.put(AddressController());

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
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 24.r),
              child: GetBuilder<AddressController>(builder: (controller) {
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
                          color: AppColors.colorTextSub6,
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
                  EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 25.r),
              child: GetBuilder<AddressController>(builder: (controller) {
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
                          color: AppColors.colorTextSub6,
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
              margin:
              EdgeInsetsDirectional.only(top: 25.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: controller.streetController,
                keyboardType: TextInputType.streetAddress,
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
                        text: 'street',color: AppColors.colorTextSub6, fontWeight: FontWeight.w400),
                    hintText: 'street_required'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub6,
                        fontSize: 14.h,
                        fontFamily: Const.appFont,
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
                    )),
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 25.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: controller.houseNumberController,
                keyboardType: TextInputType.number,
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
                        text: 'house_number',color: AppColors.colorTextSub6, fontWeight: FontWeight.w400),
                    hintText: 'house_number_required'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub6,
                        fontSize: 14.h,
                        fontFamily: Const.appFont,
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
                    )),
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 25.r),
                child: Image.asset('${Const.images}image_map_address.png')),
            Container(
                margin:
                    EdgeInsetsDirectional.only(start: 24.r, end: 24.r, top: 48.r),
                child: AppWidgets.CustomButton(
                    text: 'Save',
                    radius: 48.r,
                    isUpperCase: false,
                    click: () {
                      if (controller.isValidation(context)) Navigator.pop(context);
                    }))
          ],
        ),
      ),
    );
  }
}
