import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/services.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class BeautyCenterController extends GetxController{

  List<Services> listServices = [
    Services(id: 1, name: 'Dye', image: Const.serviceCenter1),
    Services(id: 2, name: 'Hair cut', image: Const.serviceCenter2),
    Services(id: 3, name: 'Skin-Care', image: Const.serviceCenter3),
    Services(id: 4, name: 'Makeup', image: Const.serviceCenter4),
    Services(id: 5, name: 'Nail care', image: Const.serviceCenter5),
    Services(id: 6, name: 'Makeup', image: Const.serviceCenter6),
    Services(id: 6, name: 'Makeup', image: Const.serviceCenter6),
    Services(id: 6, name: 'Makeup', image: Const.serviceCenter6),
  ];

  List<Services> listExperts = [
    Services(id: 1, name: 'Dye', image: Const.serviceCenter1),
    Services(id: 2, name: 'Hair cut', image: Const.serviceCenter2),
    Services(id: 3, name: 'Skin-Care', image: Const.serviceCenter3),
    Services(id: 4, name: 'Makeup', image: Const.serviceCenter4),
    Services(id: 5, name: 'Nail care', image: Const.serviceCenter5),
    Services(id: 6, name: 'Makeup', image: Const.serviceCenter6),
  ];

  void showRatingDialog(BuildContext context) {
    showDialog(context: context,
        builder: (_) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            width: double.infinity,
            height: 280.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(20.r)
            ),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsetsDirectional.only(top: 22.r),
                    child: AppText.medium(text: 'rating', color: AppColors.colorAppMain)),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 8.r, top: 16.r, end: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar(
                            ratingWidget: RatingWidget(
                                full: SvgPicture.asset('${Const.icons}icon_star.svg'),
                                half: SvgPicture.asset('${Const.icons}star_half_yallow.svg'),
                                empty: SvgPicture.asset('${Const.icons}icon_empty_star.svg')),
                            itemCount: 5,
                            itemSize: 40,
                            allowHalfRating: false,
                            onRatingUpdate: (val) {
                              log('RATE: ${val}');
                            },),
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            start: 20.r, end: 20.r, top: 16.r
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.go,
                            // controller: commentController,
                            keyboardType: TextInputType.multiline,
                            cursorColor: AppColors.colorAppMain,
                            cursorWidth: 1.3.w,
                            cursorRadius: const Radius.circular(10).r,
                            enabled: true,
                            maxLines: 2,
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.black),
                            decoration: InputDecoration(
                                hintText: 'write_comment'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.colorAppMain,
                                    fontSize: 14.h,
                                    fontFamily: Const.appFont,
                                    fontWeight: FontWeight.w400
                                ),
                                fillColor: AppColors.colorWhite,
                                filled: true,
                                helperMaxLines: 2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.colorAppMain, width: 1.w),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.colorAppMain, width: 1.w),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                constraints: const BoxConstraints(
                                  maxHeight: 80,
                                  minWidth: 48,
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(
                              start: 20.r, end: 20.r, top: 16.r
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AppWidgets.CustomButton(
                                    text: 'cancel',
                                    width: 100.w,
                                    height: 48.h,
                                    isUpperCase: false,
                                    background: AppColors.colorGray1,
                                    borderColor: AppColors.colorGray1,
                                    textColor: AppColors.colorAppMain,
                                    fontWeight: FontWeight.w400,
                                    radius: 40.r,
                                    click: () => Navigator.pop(context)),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: AppWidgets.CustomButton(
                                    text: 'rate',
                                    width: 100.w,
                                    height: 48.h,
                                    isUpperCase: false,
                                    background: AppColors.colorErrorBG,
                                    borderColor: AppColors.colorErrorBG,
                                    textColor: AppColors.colorErrorText,
                                    fontWeight: FontWeight.w400,
                                    radius: 40.r,
                                    click: () {}),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}