

import 'package:get/get.dart';
import 'package:nilay/bindings/forget_password_bindings.dart';
import 'package:nilay/bindings/signin_bindings.dart';
import 'package:nilay/bindings/signup_bindings.dart';
import 'package:nilay/controller/forget_password_controller.dart';
import 'package:nilay/ui/auth/forget_password/congratulations_screen.dart';
import 'package:nilay/ui/auth/forget_password/new_password_screen.dart';
import 'package:nilay/ui/auth/forget_password/select_email_phone_screen.dart';
import 'package:nilay/ui/auth/forget_password/send_code_screen.dart';
import 'package:nilay/ui/auth/forget_password/verification_code_screen.dart';
import 'package:nilay/ui/auth/signin_screen.dart';
import 'package:nilay/ui/auth/signup_screen.dart';
import 'package:nilay/ui/boarding_screen.dart';
import 'package:nilay/ui/home/home_screen.dart';
import 'package:nilay/ui/language_screen.dart';
import 'package:nilay/ui/orders/orders_vendor_screen.dart';
import 'package:nilay/ui/splash_screen.dart';

class AppRoutes {

  static final routesPages = [
    // TODO BOARDING SCREENS
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.language, page: () => LanguageScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),

    // TODO AUTH SCREENS
    GetPage(name: Routes.signIn, page: () => SignInScreen(), binding: SignInBinging()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen(), binding: SignUpBinging()),
    GetPage(name: Routes.selectEmailPhone, page: () => SelectEmailPhoneScreen(), binding: ForgetPasswordBinging()),
    GetPage(name: Routes.sendCode, page: () => SendCodeScreen()),
    GetPage(name: Routes.verificationCode, page: () => VerificationCodeScreen()),
    GetPage(name: Routes.newPassword, page: () => NewPasswordScreen()),
    GetPage(name: Routes.congratulations, page: () => CongratulationsScreen()),

    // TODO HOME SCREEN WITH ORDERS
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.vendorOrders, page: () => VendorOrdersScreen()),


  ];
}

class Routes {
  static const splash = '/splash';
  static const language = '/language';
  static const boarding = '/boarding';
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const selectEmailPhone = '/select_email_phone';
  static const sendCode = '/send_code';
  static const verificationCode = '/verify_code';
  static const newPassword = '/new_password';
  static const congratulations = '/congratulations';

  static const home = '/home';
  static const vendorOrders = '/vendor_orders';

  static const map = '/map';

}