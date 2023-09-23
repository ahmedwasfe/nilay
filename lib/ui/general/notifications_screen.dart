import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/notifications_controller.dart';
import 'package:nilay/ui/home/pages/profile_page.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class NotificationsScreen extends StatelessWidget {
  final _controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(
          text: 'notification',
          color: AppColors.colorAppMain,
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
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: SvgPicture.asset(
                // width: 24.w, height: 24.h,
                '${Const.icons}icon_reload.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
            _controller.listNotifications.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _controller.listNotifications.length,
                    itemBuilder: (_, index) => buildNotificationItem())
                : Center(
                    heightFactor: 2.8,
                    child: NoDataItem(
                      icon: '${Const.icons}icon_profile_notification.svg',
                      textMain: 'no_notification_yet',
                      textSub: 'notification_alert',
                    ),
                  ),
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
                  offset: const Offset(0.0, 1.0))
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
                  backgroundImage: const NetworkImage(
                    Const.imageUserOnline1,
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
