import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/components.dart';

class SignUpController extends GetxController {

  late TextEditingController fullNameController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isVisiblePass = true;
  String visiblePassIcon = 'icon_password_hide.svg';

  bool isVisibleConfirmPass = true;
  String visibleConfirmPassIcon = 'icon_password_hide.svg';

  @override
  void onInit() {
    fullNameController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? 'icon_password_hide.svg' : 'icon_password_show.svg';
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass ? 'icon_password_hide.svg' : 'icon_password_show.svg';
    update();
  }

  bool isValidation(BuildContext context) {
    if(fullNameController.text.isEmpty) {
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_your_name',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(usernameController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_username',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(phoneController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_phone_number',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(emailController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_email',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(!AppHelper.emailValidate().hasMatch(emailController.text)){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_email_valid',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(passwordController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_password',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(passwordController.text.length < 6 ) {
      AppWidgets.showSnackBar(context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_confirm_password',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text.length < 6 ) {
      AppWidgets.showSnackBar(context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text != passwordController.text) {
      AppWidgets.showSnackBar(context: context,
          message: 'tow_password_not_match',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

}