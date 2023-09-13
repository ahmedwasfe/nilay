import 'dart:convert';

import 'package:get/get.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class SplashController extends GetxController{
  bool? isBoarding = PreferencesManager.getAppData(key: Const.KEY_BOARDING);
  RxBool isAnimate = false.obs;

  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    isAnimate(true);
    await Future.delayed(const Duration(milliseconds: 5000));
  }

  Future startApp() {
    // PreferencesManager.clearData(key: Const.KEY_BOARDING);
    if(isBoarding != null) {
      if (AppHelper.getCurrentUserToken() != null) {
        return Future.delayed(
            const Duration(seconds: 8), () => Get.offAndToNamed(Routes.home));
      } else {
        return Future.delayed(
            const Duration(seconds: 8), () =>
            Get.offAndToNamed(Routes.signIn));
      }

    }else {
      return Future.delayed(
          const Duration(seconds: 8), () => Get.offAndToNamed(Routes.language));
    }
  }

}