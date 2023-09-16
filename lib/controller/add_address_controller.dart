import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/model/add_address.dart';
import 'package:nilay/utils/app_color.dart';

import '../utils/components.dart';

class AddAddressController extends GetxController {
  RxString governorateSelected = ''.obs;
  String governorateId = '0';
  RxString regoinSelected = ''.obs;
  String regoinId = '0';

  List<AddAddress> listAddress = [];

  /*
  
   AddAddress(
        adsress: '',
        governorate: 'Gaza',
        governorateId: '1',
        region: 'Remal region',
        regionId: '1',
        street: 'Al Nasser street',
        houseNumber: '61,22,05,00'),
    AddAddress(
        adsress: '',
        governorate: 'Rafah',
        governorateId: '2',
        region: 'Remal region',
        regionId: '2',
        street: 'Al Itsalat street',
        houseNumber: '61,27,05,88'),
    AddAddress(
        adsress: '',
        governorate: 'Gaza',
        governorateId: '1',
        region: 'Remal region',
        regionId: '1',
        street: 'Al Nasser street',
        houseNumber: '61,22,05,00'),
    AddAddress(
        adsress: '',
        governorate: 'Rafah',
        governorateId: '2',
        region: 'Remal region',
        regionId: '2',
        street: 'Al Itsalat street',
        houseNumber: '61,27,05,88'),
  */

  bool isValidation(BuildContext context) {
    if (governorateId == '0') {
      AppWidgets.showSnackBar(
          context: context,
          message: 'select_your_governorate',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (regoinId == '0') {
      AppWidgets.showSnackBar(
          context: context,
          message: 'select_your_region',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else {
      return true;
    }
  }
}
