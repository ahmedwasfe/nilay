import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/ui/home/pages/profile_page.dart';
import 'package:nilay/utils/constants.dart';

import '../../utils/app_color.dart';
import '../../utils/app_helper.dart';
import '../../utils/app_text.dart';

class AddedNotificationsPage extends StatelessWidget {
  const AddedNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(
          text: 'notification',
          color: AppColors.colorAppSub2,
        ),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Get.to(ProfilePage()),
        ),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: SvgPicture.asset('${Const.icons}icon_reload.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsetsDirectional.only(start: 20.w),
                child: AppText.medium(
                    text: 'Today 22 jan 2023',
                    color: AppColors.grayColorBg,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400)),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (_, index) => buildNotificationItem())
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem() => Container(
      
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(16.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 0,
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(0.0, 1.0))
            ]),
        margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 17.h),
        child: Container(
          height: 91.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 6.w),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    '${Const.images}pic1.jpg',
                  ),
                  radius: 32.r,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 35.h,
                      // width: double.infinity,
                      margin: EdgeInsetsDirectional.only(
                          start: 12.w, end: 6.w, top: 17.h),
                      child: AppText.medium(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing.Lorem',
                        fontSize: 14.sp,
                        color: AppColors.grayColorBg,
                        fontWeight: FontWeight.w400,
                        maxline: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 12.w, top: 8.h),
                      child: AppText.medium(
                        text: '1:22 PM',
                        fontSize: 14.sp,
                        color: AppColors.grayColorBg,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
