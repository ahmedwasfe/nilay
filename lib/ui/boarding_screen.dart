import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:nilay/controller/boarding_controller.dart';
import 'package:nilay/model/boardings.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatelessWidget {

  final _controller = Get.put(BoardingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: GetBuilder<BoardingController>(builder: (controller) => Stack(
        children: [
          LiquidSwipe.builder(
              itemCount: _controller.listBoarding.length,
              itemBuilder: (_, index) => pageViewScreens(_controller.listBoarding[index]),
              waveType: WaveType.liquidReveal,
              liquidController: _controller.liquidController,
              slideIconWidget: Icon(AppHelper.getAppLanguage() == 'ar' ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
              enableSideReveal: true,
              onPageChangeCallback: controller.onPageChangeCallback),
          /*PageView.builder(
              controller: _controller.pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: _controller.listBoarding.length,
              itemBuilder: (context, index) => pageViewScreens(_controller.listBoarding[index]),
              onPageChanged: (index) {
                if (index == _controller.listBoarding.length - 1) {
                  _controller.isLast.value = true;
                } else {
                  _controller.isLast.value = false;
                }
              }),*/
          Container(
            margin: EdgeInsetsDirectional.only(top: 500.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _controller.liquidController.currentPage,
                        count: _controller.listBoarding.length,
                        effect: CustomizableEffect(
                          dotDecoration: DotDecoration(
                            height: 8.h,
                            width: 8.w,
                            color: AppColors.grayColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          activeDotDecoration: DotDecoration(
                            height: 8.h,
                            width: 35.w,
                            color:AppColors.colorAppMain,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onDotClicked: (index) {
                          // if (_controller.isLast.value) {
                          //   _controller.pageController.previousPage(
                          //       duration: const Duration(milliseconds: 750),
                          //       curve: Curves.easeInToLinear);
                          // } else {
                          //   _controller.pageController.nextPage(
                          //       duration: const Duration(milliseconds: 750),
                          //       curve: Curves.easeInToLinear);
                          // }
                        },
                      ),
                    ),
                    SizedBox(width: 20.r),
                    AppWidgets.CustomButton(
                        text: 'skip'.tr,
                        width: 100.w,
                        height: 30.h,
                        radius: 20.r,
                        isUpperCase: false,
                        click: () => _controller.goToLogin())
                  ],
                ),
                SizedBox(height: 80.h),
                // OutlinedButton(
                //     onPressed: () {
                //       if(_controller.isLast.isTrue){
                //         _controller.goToLogin();
                //       }else {
                //         int nextPage = controller.currentPage + 1;
                //         controller.liquidController.animateToPage(page: nextPage);
                //       }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       side: const BorderSide(color: Colors.black26),
                //       shape: const CircleBorder(),
                //       padding: EdgeInsets.all(16.r),
                //       onPrimary: Colors.white
                //     ),
                //     child: Container(
                //       padding: EdgeInsets.all(16.r),
                //       decoration: const BoxDecoration(
                //         color: AppColors.darkSecondColor,
                //         shape: BoxShape.circle,
                //       ),
                //       child: const Icon(Icons.arrow_forward_ios),
                //     ))
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget pageViewScreens(Boardings boarding) => Container(
    color: boarding.bgColor,
    margin: EdgeInsets.only(top: 20.r),
    child: Column(
      // alignmen/t: Alignment.topCenter,
      children: [
        Container(
          height: 300,
          width: double.infinity,
          margin: EdgeInsetsDirectional.only(top: 20.r, start: 20.r, end: 28.r),
          child: SvgPicture.asset('${Const.images}${boarding.image}',
              fit: BoxFit.scaleDown),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                child: AppText.medium(
                    fontWeight: FontWeight.w400,
                    text: boarding.title,
                    fontSize: 18.sp,
                    textAlign: TextAlign.center,
                    maxline: 3,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
