import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/splash_controller.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: false);
    controller.startAnimation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('${Const.images}logo.png'),
      ),
    );
  }
}

/*TODO
*
*  Center(
        child: AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            bottom: controller.isAnimate.isTrue ? 80 : 0,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 8000),
                opacity: controller.isAnimate.isTrue ? 1 : 0,
                child: Image.asset('${Const.images}logo.png'))),
      ),
* */