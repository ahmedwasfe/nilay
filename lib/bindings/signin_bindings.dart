

import 'package:get/get.dart';
import 'package:nilay/controller/signin_controller.dart';

class SignInBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}