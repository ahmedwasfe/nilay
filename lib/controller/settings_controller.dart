import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/model/country.dart';
import 'package:nilay/model/language.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class SettingsController extends GetxController {

  
  List<Country> listCountries = [
    Country(id: 1, name: 'egypt'.tr, flag: 'icon_flag_egypt.svg', isSelected: false),
    Country(id: 2, name: 'palestine'.tr, flag: 'icon_flag_palestinian.svg', isSelected: false),
    Country(id: 3, name: 'saudi_arabia'.tr, flag: 'icon_flag_saudi.svg', isSelected: false),
    Country(id: 4, name: 'uae'.tr, flag: 'icon_flag_emirates.svg', isSelected: false),
    Country(id: 5, name: 'kuwait'.tr, flag: 'icon_flag_kuwait.svg', isSelected: false),
  ];
  RxString countrySelected_ = ''.obs;
  RxString flagSelected = ''.obs;
  int countrySelectedId = 0;

  List<Language> listLanguages = [
    Language(languageName: 'English', languageCode: Const.KEY_LANGUAGE_EN, isSelected: false),
    Language(languageName: 'العربية', languageCode: Const.KEY_LANGUAGE_AR, isSelected: false),
  ];
  RxString languageSelected = ''.obs;

  void saveLanguage(String langCode) {
    Locale locale = Locale(langCode);
    PreferencesManager.saveAppLanguage(key: Const.KEY_LANGUAGE, languageCode: langCode);
    Get.updateLocale(locale);
  }

  bool isValidation(BuildContext context) {
    if(countrySelectedId == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'select_your_country',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
     return false;
    }else if(languageSelected.value.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'select_your_language',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
     return true;
    }
  }
  
}