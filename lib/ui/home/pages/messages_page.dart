import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/messages_controller.dart';
import 'package:nilay/model/test/messages.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class MessagesPage extends StatelessWidget {

  final _controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'messages', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 20.r),
          child: CircleCachedImage(imageUrl: AppHelper.getCurrentUser()!.photo!, isLoading: false),
        ),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: Stack(
              // alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                    width: 24.w,
                    height: 24.h,
                    AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)
                  ),
                  child: AppText.medium(text: '8',
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(top: 40.r, end: 10.r, start: 20.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _controller.listUsers.map((user) => _buildUsersOnline(user)).toList()
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.listMessages.length,
                  itemBuilder: (_, index) => _buildMessagesItem(_controller.listMessages[index])),
            )
          ],
        ),
      )
    );
  }

  Widget _buildUsersOnline(Messages user) => Container(
    margin: EdgeInsetsDirectional.only(start: 0.r, end: 8.r),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(50.r)
    ),
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.colorAppMain,
              radius: 32.r,
              child: Container(
                clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50.r)
                  ),
                  child: CachedImage(
                      isLoading: false,
                      imageUrl: user.image)),
            ),
            Container(
              padding: EdgeInsetsDirectional.all(4.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(50.r)
              ),
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 0.r),
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.colorOnline,
                  borderRadius: BorderRadiusDirectional.circular(50.r)
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 8.r),
          child: AppText.medium(text: user.name, fontWeight: FontWeight.w400, fontSize: 14.sp),
        )
      ],
    ),
  );

  Widget _buildMessagesItem(Messages message) => Container(
    width: double.infinity,
    margin: EdgeInsetsDirectional.only(start: 20.r, top: 20.r, end: 20.r),
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.colorAppMain,
              radius: 32.r,
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50.r)
                  ),
                  child: CachedImage(
                      isLoading: false,
                      imageUrl: message.image)),
            ),
           message.isOnline ? Container(
              padding: EdgeInsetsDirectional.all(4.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(50.r)
              ),
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 0.r),
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                    color: AppColors.colorOnline,
                    borderRadius: BorderRadiusDirectional.circular(50.r)
                ),
              ),
            ) : Container()
          ],
        ),
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 16.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.medium(text: message.name, fontWeight: FontWeight.w400, fontSize: 16.sp),
                      SizedBox(height: 5.h),
                      AppText.medium(text: message.lastMessage, fontWeight: FontWeight.w400, fontSize: 14.sp),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.medium(text: message.time, fontWeight: FontWeight.w400, fontSize: 16.sp),
                    SizedBox(height: 5.h),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 4.r),
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: message.isRead ? AppColors.colorWhite : AppColors.colorAppMain,
                          borderRadius: BorderRadiusDirectional.circular(50.r)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
