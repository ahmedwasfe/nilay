import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/model/user.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class PersonalInfoController extends GetxController {


 XFile? userProfile;

  late TextEditingController fullNameController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void onInit() {
    fullNameController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();

    if(AppHelper.getCurrentUser() != null){
      CurrentUser user = AppHelper.getCurrentUser()!;
      fullNameController.text = user.name!;
      usernameController.text = user.name!;
      phoneController.text = user.mobile??'';
      emailController.text = user.email!;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

 void requestStoragePermission() async {
   if (await Permission.storage.isDenied) {
     Map<Permission, PermissionStatus> statuses = await [
       Permission.storage,
     ].request();
     print("storage permission: ${statuses[Permission.storage]}");
     pickImage();
   }else {
     pickImage();
   }
 }

 void pickImage() async {
    ImagePicker picker = ImagePicker();
    userProfile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    log('Image Path: ${userProfile!.path}');
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
   }else {
     return true;
   }
 }

 void updateProfile(BuildContext context) {
    if(isValidation(context)){
      AppWidgets.showSnackBar(context: context,
          message: 'profile_modified_success',
          textColor: AppColors.colorWhite,
          backgroundColor: AppColors.colorSuccessBG1,
          iconColor: AppColors.colorWhite,
      startIcon: SvgPicture.asset('${Const.icons}icon_good_success.svg'));
      // Navigator.pop(context);
    }else {

    }
 }

}