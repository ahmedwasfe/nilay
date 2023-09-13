
import 'package:get/get.dart';
import 'package:nilay/controller/boarding_controller.dart';
import 'package:nilay/controller/home_controller.dart';
import 'package:nilay/controller/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BoardingController());
    Get.lazyPut(() => HomeController());
  }
}
