import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nilay/model/boardings.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class BoardingController extends GetxController{

  PageController pageController = PageController();
  final liquidController = LiquidController();
  int currentPage = 0;

  List<Boardings> listBoarding = [
    Boardings(title: 'title1', image: 'boarding1.svg', bgColor: AppColors.grayColorBg2),
    Boardings(title: 'title2', image: 'boarding2.svg', bgColor: AppColors.colorBoarding1),
    Boardings(title: 'title3', image: 'boarding3.svg', bgColor: AppColors.colorBoarding2),
  ];
  RxBool isLast = false.obs;

  void onPageChangeCallback(int activePageIndex) {
    currentPage = activePageIndex;
    if (activePageIndex == listBoarding.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
    update();
  }

  void goToLogin() {
    PreferencesManager.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) Get.offAndToNamed(Routes.signIn)});
  }

}