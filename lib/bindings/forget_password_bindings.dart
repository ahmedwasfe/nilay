

import 'package:get/get.dart';
import 'package:nilay/controller/forget_password_controller.dart';

class ForgetPasswordBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}