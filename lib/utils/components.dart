import 'dart:core';
import 'dart:core';

import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';

class AppWidgets {
  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = double.infinity,
    bool isEnable = true,
    double height = 48.0,
    Color background = AppColors.colorAppMain,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w700,
    double radius = 0.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.colorAppMain,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: isEnable ? click : null,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );

  static Widget CustomAnimationProgress({Color color = AppColors.colorAppMain}) => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 40.w,
          height: 40.h,
          child: LoadingAnimationWidget.threeArchedCircle(
              color: color, size: 25.h)));

  static showSnackBar(
      {required BuildContext context,
      required String message,
      Color textColor = AppColors.colorWhite,
      Color backgroundColor = AppColors.colorSnackBaErrorColor,
      Color iconColor = AppColors.colorSnackBaErrorColor,
      Widget? startIcon,
      Color startIconColor = AppColors.colorErrorText}) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       behavior: SnackBarBehavior.floating,
    //       margin: EdgeInsetsDirectional.only(
    //         bottom: MediaQuery.of(context).size.height - 130,
    //       ),
    //         padding: EdgeInsetsDirectional.only(top: 18.r, bottom: 20.r, start: 20.r, end: 20.r),
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //         content: Stack(
    //           clipBehavior: Clip.none,
    //           children: [
    //             Container(
    //               height: 60.h,
    //               padding: EdgeInsets.all(16.r),
    //               decoration: BoxDecoration(
    //                   color: backgroundColor,
    //                   borderRadius: BorderRadius.circular(20.r)
    //               ),
    //               child: Row(
    //                 children: [
    //                   SizedBox(width: 48.w),
    //                   Expanded(
    //                     child: AppText.medium(text: message,
    //                         fontWeight: FontWeight.w500,
    //                         color: textColor,
    //                         fontSize: 14.sp,
    //                         maxline: 2),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               child: ClipRRect(
    //                 borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(20.r)),
    //                 child: SvgPicture.asset(
    //                     height: 38.h,
    //                     width: 30.w,
    //                     color: iconColor,
    //                     '${Const.icons}icon_faill_bubbles.svg'),
    //               ),
    //             ),
    //             PositionedDirectional(
    //                 top: -10,
    //                 start: 0,
    //                 child: Stack(
    //                   alignment: Alignment.center,
    //                   children: [
    //                     SvgPicture.asset(height: 30.r,
    //                         color: iconColor,
    //                         '${Const.icons}icon_fail.svg'),
    //                     Positioned(
    //                       top: 10,
    //                       child: SvgPicture.asset(height: 10.r,
    //                           '${Const.icons}icon_faill_close.svg'),
    //                     ),
    //                   ],
    //                 ))
    //           ],
    //         ))
    // );
    awesomeTopSnackbar(
      context,
      message.tr,
      textStyle: TextStyle(
          color: textColor,
          fontFamily: Const.appFont,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp),
      backgroundColor: backgroundColor,
      starIcon:
          startIcon ?? Icon(Icons.error_outline_rounded, color: startIconColor),
      icon: Icon(Icons.close, color: iconColor),
      iconWithDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: backgroundColor),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String? text;
  Function()? click;
  double width = double.infinity;
  bool isEnable = true;
  double height = 48.0;
  Color background = AppColors.colorAppMain;
  bool isUpperCase = true;
  Color textColor = Colors.white;
  double fontSize = 16.0;
  String fontfamily = Const.appFont;
  FontWeight fontWeight = FontWeight.w700;
  double radius = 0.0;
  double marginLeft = 0.0;
  Color borderColor = AppColors.colorAppMain;
  double borderWidth = 1.5;

  CustomButton({
    super.key,
    required String text,
    required Function() click,
    double width = double.infinity,
    bool isEnable = true,
    double height = 48.0,
    Color background = AppColors.colorAppMain,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w700,
    double radius = 0.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.colorAppMain,
    double borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background,
          border: Border.all(color: borderColor, width: borderWidth)),
      child: MaterialButton(
        onPressed: isEnable ? click : null,
        child: Text(
          isUpperCase ? text!.toUpperCase().tr : text!.tr,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize.sp,
              fontFamily: fontfamily,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}

class CachedImage extends StatelessWidget {
  String imageUrl;
  double width = 272;
  double height = 159;
  BoxFit fit = BoxFit.cover;
  Color progressColor = AppColors.colorAppMain;
  bool isLoading = true;

  CachedImage(
      {super.key, required this.imageUrl,
      this.width = 272,
      this.height = 159,
      this.fit = BoxFit.cover,
        this.progressColor = AppColors.colorAppMain,
      this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width.w,
        height: height.r,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        // placeholder: (_, imageurl) => Container(),
        progressIndicatorBuilder: (_, imageUrl, downloaded) =>
            isLoading ? AppWidgets.CustomAnimationProgress(color: progressColor) : Container(),
        // fadeOutCurve: Curves.,
        errorWidget: (_, imageUrl, error) => Container(
              width: width.w,
              height: height.r,
              color: Colors.white,
              child: Image.asset(
                  width: width.w,
                  height: height.r,
                  fit: BoxFit.scaleDown,
                  '${Const.images}logo.png'),
            ));
  }

// Image(
//     width: 272.w,
//     height: 159.r,
//     image: CachedNetworkImageProvider(vendor.image), fit: BoxFit.cover),
/*Image.network(
            width: 272.w,
            height: 159.r,
            vendor.image, fit: BoxFit.cover)*/
}

class CircleCachedImage extends StatelessWidget {
  String imageUrl;
  double width = 272;
  double height = 159;
  double radius = 40;
  BoxFit fit = BoxFit.cover;
  bool isLoading = true;

  CircleCachedImage(
      {required this.imageUrl,
      this.width = 272,
      this.height = 159,
      this.radius = 40,
      this.fit = BoxFit.cover,
      this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.colorAppMain,
      radius: radius,
      child: ClipOval(
        child: CachedNetworkImage(
            width: width.w,
            height: height.r,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            // placeholder: (_, imageurl) => Container(),
            progressIndicatorBuilder: (_, imageUrl, downloaded) =>
                isLoading ? AppWidgets.CustomAnimationProgress() : Container(),
            // fadeOutCurve: Curves.,
            errorWidget: (_, imageUrl, error) => Container(
                  width: width.w,
                  height: height.r,
                  color: Colors.white,
                  child: Image.asset(
                      width: width.w,
                      height: height.r,
                      fit: BoxFit.scaleDown,
                      '${Const.images}logo.png'),
                )),
      ),
    );
  }

// Image(
//     width: 272.w,
//     height: 159.r,
//     image: CachedNetworkImageProvider(vendor.image), fit: BoxFit.cover),
/*Image.network(
            width: 272.w,
            height: 159.r,
            vendor.image, fit: BoxFit.cover)*/
}

class CustomSnakBar extends StatelessWidget {
  const CustomSnakBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        padding: EdgeInsetsDirectional.only(
            top: 28.r, bottom: 20.r, start: 20.r, end: 20.r),
        backgroundColor: Colors.white,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 80.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                  color: const Color(0xFFC72C41),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                children: [
                  SizedBox(width: 48.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'Oh Snap!',
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorWhite,
                            fontSize: 16.sp),
                        const Spacer(),
                        AppText.medium(
                            text: 'Please enter your phone number',
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorWhite,
                            fontSize: 12.sp,
                            maxline: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20.r)),
                child: SvgPicture.asset(
                    height: 48.h,
                    width: 40.w,
                    '${Const.icons}icon_faill_bubbles.svg'),
              ),
            ),
            PositionedDirectional(
                top: -20,
                start: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                        height: 40.r, '${Const.icons}icon_fail.svg'),
                    Positioned(
                      top: 10,
                      child: SvgPicture.asset(
                          height: 16.r, '${Const.icons}icon_faill_close.svg'),
                    ),
                  ],
                ))
          ],
        ));
  }
}

class MainToolBar extends StatelessWidget {
  String? title;
  String? route = '';
  bool? isBack = false;

  MainToolBar({required this.title, this.route, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            const SizedBox(width: 20),
            isBack!
                ? InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () => Get.offAndToNamed(route!))
                : Container(),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                '$title'.tr,
                style: const TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: Const.appFont),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextAbout extends StatelessWidget {
  const TextAbout({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Text(
        title.tr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xff000000),
            fontFamily: Const.appFont),
      ),
    );
  }
}

class NoDataItem extends StatelessWidget {
  final String icon;
  final String textMain;
  final String textSub;
  FontWeight? fontWeight = FontWeight.w400;
  bool isrequierd = true;

  NoDataItem({
    super.key,
    required this.icon,
    required this.textMain,
    required this.textSub,
    this.fontWeight,

    //  this.isrequierd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 90.w,
            height: 90.h,
            padding: EdgeInsetsDirectional.all(4.r),
            margin: EdgeInsetsDirectional.only(bottom: 27.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(60.r),
                border: Border.all(color: AppColors.colorAppMain)),
            child: Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: AppColors.colorAppSub,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.scaleDown,
              ),
            )),
        AppText.medium(text: textMain, color: AppColors.colorAppMain),
        Container(
          margin: EdgeInsetsDirectional.only(
              top: 15.h, start: 52.w, end: 52.w, bottom: 48.h),
          child: AppText.medium(
              text: textSub,
              color: AppColors.colorTextSub7,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxline: 2),
        ),
      ],
    );
  }
}

/*
* TODO CODE PACKAGE SLIDER
*
* CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                aspectRatio: 16/9,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
              items: _controller.listCategories.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                            color: Colors.white
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.r)
                          ),
                          child: CachedImage(imageUrl: i.image),
                        )
                    );
                  },
                );
              }).toList(),
            )
* */
