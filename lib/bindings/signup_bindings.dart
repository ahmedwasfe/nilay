

import 'package:get/get.dart';
import 'package:nilay/controller/signup_controller.dart';

class SignUpBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}