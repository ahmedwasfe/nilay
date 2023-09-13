import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:nilay/api/api_requestes.dart';
import 'package:nilay/model/facebook_user.dart';
import 'package:nilay/model/user.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class SignInController extends GetxController{

  late TextEditingController phoneController;
  late TextEditingController passwordController;

  bool isVisiblePass = true;
  String visiblePassIcon = 'icon_password_hide.svg';

  FacebookUser facebookUser = FacebookUser();
  late final Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;
  CurrentUser user = CurrentUser();

  RxBool isGoogleLoading = false.obs;

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
  }

  User? get firebaseUser => _firebaseUser.value;

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? 'icon_password_hide.svg' : 'icon_password_show.svg';
    update();
  }

  bool isValidation(BuildContext context) {
    if(phoneController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_enter_phone_number',
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
    }else {
      return true;
    }
  }

  void facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      print('accessToken: ${accessToken.token}');
      ApiRequestes.facebbokLogin(facebookToken: accessToken.token)
      .then((value) {
        if(value != null){
          facebookUser = value;
          user.uuid = facebookUser.id;
          user.name = facebookUser.name;
          user.email = facebookUser.email;
          user.mobile = '';
          user.photo = facebookUser.picture!.picture!.url;
          user.provider = 'facebook.com';
          PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: user)
          .then((value) {
            if(value != null){
              PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: user.uuid!);
              Get.toNamed(Routes.home);
            }
          });
          print('PROFILE: ${jsonEncode(value)}');
          update();
        }
      });
      // final response = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}'));
      // final profile = jsonDecode(response.body);

    } else if(result.status == LoginStatus.cancelled){
      print('cancelled: ${result.status}');
      print('cancelled: ${result.message}');
      AppHelper.showToast(message: result.message!, color: Colors.redAccent);
    }else {
      print('ERROR: ${result.status}');
      print('ERROR: ${result.message}');
    }
    update();
  }

  Future<UserCredential?> signInWithGoogle() async {
    print('credential: ');
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    try{

// Trigger the authentication flow1
      final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: scopes).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken);


      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch(e) {
      // final ex = Exception.fromCode(e.message);
      throw e.message!;
    }catch (_) {
      // throw _.message!;
    }
    return null;

  }

  Future<void> googleSignIn() async {
    try{
      isGoogleLoading(true);
      signInWithGoogle()
      .then((value) {
        if(value != null) {
          _firebaseUser.value = value.user!;
          user.uuid = _firebaseUser.value!.uid;
          user.name = _firebaseUser.value!.displayName;
          user.email = _firebaseUser.value!.email;
          user.mobile = _firebaseUser.value!.phoneNumber;
          user.photo = _firebaseUser.value!.photoURL;
          user.provider = _firebaseUser.value!.providerData[0].providerId;
          PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: user)
              .then((value) {
            if(value != null){
              PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: user.uuid!);
              Get.toNamed(Routes.home);
            }
          });
          print('GOOGLE USER: ${value.user!}');
          update();
        }

        // print('GOOGLE: ${jsonEncode(value!.user)}');
        // Get.toNamed(Routes.home);
      });
      isGoogleLoading(false);
      // print('GOOGLE: ${jsonEncode(firebaseUser)}');

    }catch (e) {
      isGoogleLoading(false);
      AppHelper.showSnackBar(title: 'error', isSuccess: false);
    }
    update();
  }

  void login() {
    Random random = Random();
    user.uuid = random.nextInt(10000000).toString();
    user.name = 'AHMED';
    user.email = '';
    user.mobile = phoneController.text;
    user.photo = Const.defaultUserImage1;
    user.provider = 'Phone Number';
    PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: user)
        .then((value) {
      if(value != null){
        PreferencesManager.saveUserToken(key: Const.KEY_USER_TOKEN, token: user.uuid!);
        Get.toNamed(Routes.home);
      }
    });
  }

}