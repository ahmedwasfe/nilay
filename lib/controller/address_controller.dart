import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/add_address.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/components.dart';

class AddressController extends GetxController {
  RxString governorateSelected = ''.obs;
  int governorateId = 0;
  RxString regoinSelected = ''.obs;
  int regoinId = 0;

  late TextEditingController streetController;
  late TextEditingController houseNumberController;

  List<AddAddress> listAddress = [
    AddAddress(
        address: '',
        governorate: 'Gaza',
        governorateId: 1,
        region: 'Remal region',
        regionId: 1,
        street: 'Al Nasser street',
        houseNumber: '61,22,05,00'),
    AddAddress(
        address: '',
        governorate: 'Rafah',
        governorateId: 2,
        region: 'Remal region',
        regionId: 2,
        street: 'Al Itsalat street',
        houseNumber: '61,27,05,88'),
    // AddAddress(
    //     adsress: '',
    //     governorate: 'Gaza',
    //     governorateId: '1',
    //     region: 'Remal region',
    //     regionId: '1',
    //     street: 'Al Nasser street',
    //     houseNumber: '61,22,05,00'),
    // AddAddress(
    //     adsress: '',
    //     governorate: 'Rafah',
    //     governorateId: '2',
    //     region: 'Remal region',
    //     regionId: '2',
    //     street: 'Al Itsalat street',
    //     houseNumber: '61,27,05,88'),
  ];

  @override
  void onInit() {
    streetController = TextEditingController();
    houseNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    streetController.dispose();
    houseNumberController.dispose();
    super.dispose();
  }


  bool isValidation(BuildContext context) {
    if (governorateId == 0) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'select_your_governorate'.tr,
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (regoinId == 0) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'select_your_region'.tr,
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if (streetController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'please_enter_street'.tr,
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }
    else if (houseNumberController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'please_enter_house_number'.tr,
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }
}
