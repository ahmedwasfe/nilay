import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/forget_password_controller.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatefulWidget {

  String? type;
  String? emailPhone;
  VerificationCodeScreen({this.type, this.emailPhone});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen>
    with TickerProviderStateMixin{

  final _controller = Get.put(ForgetPasswordController());
  late AnimationController _animationController;
  final focusNode = FocusNode();
  String text = '';

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 120));
    super.initState();
  }

  String get timeRemaing {
    Duration count =
        _animationController.duration! * _animationController.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        title: AppText.medium(text: 'code_verification', color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.medium(text: widget.type == Const.KEY_FORGET_EMAIL ? 'sent_code_to_email' : 'sent_code_to_phone',
                      fontWeight: FontWeight.w300, fontSize: 14.sp,
                      color: AppColors.colorTextSub3,
                      maxline: 2),
                  SizedBox(height: 16.h),
                  AppText.medium(text: widget.emailPhone!, fontWeight: FontWeight.w500),

                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) => AppText.medium(text: timeRemaing,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              child: Pinput(
                controller: _controller.pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: _controller.focusedBorderColor,
                    borderRadius: BorderRadiusDirectional.circular(50.r)
                  )
                ),
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  print('onCompleted: $pin');
                  Get.toNamed(Routes.newPassword);
                },
                onChanged: (value) {
                  print('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22.sp,
                      height: 1,
                      color: AppColors.colorBlack,
                    ),
                  ],
                ),
                disabledPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50.r)
                  )
                ),
                focusedPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    color: _controller.focusedBorderColor,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.colorWhite),
                  ),
                ),
                submittedPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    color: _controller.fillColor,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.colorWhite),
                  ),
                ),
                errorPinTheme:  _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.colorErrorText),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 28.r),
              child: InkWell(
                child: AppText.medium(
                    text: 'send_again',
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorAppMain,
                    textDecoration: TextDecoration.underline,
                    fontSize: 16.sp),
                onTap: () {
                  if (_animationController.isAnimating) {
                    _animationController.stop();
                  } else {
                    _animationController.reverse(
                        from: _animationController.value == 0
                            ? 1.0
                            : _animationController.value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
