import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/favorite_controller.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/favorite/favorite_item.dart';
import 'package:nilay/widget/favorite/top_favorite_item.dart';

class FavoritePage extends StatelessWidget {
  final _controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'favorite', color: AppColors.colorAppMain),
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
                    width: 24.w, height: 24.h, AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)),
                  child: AppText.medium(
                      text: '8',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: AppText.medium(
                  text: 'top_favorite', color: AppColors.colorAppMain),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 30.r, start: 10.r, end: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listTopFavorites
                      .map((vendor) => TopFavoriteItem(vendor: vendor))
                      .toList(),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: AppText.medium(
                  text: 'your_favourite', color: AppColors.colorAppMain),
            ),
            _controller.listFavorites.isNotEmpty
                ? Container(
                    margin: EdgeInsetsDirectional.only(
                        top: 30.r, start: 14.r, end: 14.r, bottom: 0.r),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _controller.listFavorites.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 16.r,
                          childAspectRatio: 120.r / 150.r,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => FavoriteItem(vendor:
                            _controller.listFavorites[index])),
                  )
                : Center(
                    child: NoDataItem(
                    icon: '${Const.icons}icon_favorite_empty.svg',
                    textMain: "textMain",
                    textSub: 'dont_have_favourite',
                    fontWeight: FontWeight.w500,
                  )
                    ),
          ],
        ),
      ),
    );
  }
}
