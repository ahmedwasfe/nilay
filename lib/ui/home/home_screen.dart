import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/home_controller.dart';
import 'package:nilay/model/bottom_nav_bar.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) => Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(child: controller.screens[controller.navIndex]),
              Container(
                height: 60,
                alignment: AlignmentDirectional.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(14.r),
                          topEnd: Radius.circular(14.r)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.bottomNavItems.map((nav) => _bottomNavigationBarItems(nav)).toList(),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(end: 22.r, bottom: 22.r),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54.withOpacity(0.2),
                              offset: const Offset(4, 8),
                            blurRadius: 180
                          )
                        ]
                    ),
                    child: SvgPicture.asset('${Const.icons}shape_selected.svg')),
                Container(
                  width: 45.w,
                  height: 45.h,
                  margin: EdgeInsetsDirectional.only(bottom: 10.r),
                  decoration: BoxDecoration(
                      color: AppColors.colorShapeSelected,
                      borderRadius: BorderRadiusDirectional.circular(50.r),
                      border: Border.all(color: AppColors.colorAppMain, width: 0.2),
                  ),
                  child: GetBuilder<HomeController>(builder: (controller) => SvgPicture.asset(controller.pageSelected,
                    color: AppColors.colorAppMain,
                    fit: BoxFit.scaleDown,)),
                )
              ],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    ));
  }

 Widget _bottomNavigationBarItems(BottomNavItem nav) => GetBuilder<HomeController>(builder: (controller) => InkWell(
   child: Container(
     color: Colors.white,
     margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         nav.isSelected ? Container(
           margin: EdgeInsetsDirectional.only(bottom: 0.r),
           width: 40,
           height: 6,
           decoration: BoxDecoration(
               color: AppColors.colorWhite,
               borderRadius: BorderRadiusDirectional.only(
                   bottomStart: Radius.circular(50.r),
                   bottomEnd: Radius.circular(50.r)
               )
           ),
         ) : Container(),
         !nav.icon.contains('home') ? SvgPicture.asset(controller.pageSelected.contains(nav.icon) ? '${Const.icons}icon_home.svg' : nav.icon) : Container(),
         // windows
         !nav.name.contains('home')  ? Container(
           margin: EdgeInsetsDirectional.only(bottom: 8.r),
           child: AppText.medium(text: controller.pageSelected.contains(nav.name) ? 'home'  : nav.name, color: AppColors.colorTextSub4,
               fontSize: 13.sp,
               fontWeight: FontWeight.w400),
         ) : Container()
       ],
     ),
   ),
   onTap: () {

     for(BottomNavItem nav in controller.bottomNavItems){
       nav.isSelected = false;

     }
     controller.pageSelected = nav.icon;
     print('SELECTED: ${nav.name}');
     print('PAGE SELECTED: ${controller.pageSelected}');

     controller.isHome = false;
     if(controller.isHome){
       print('HOME CLICK: ${controller.isHome}');
       controller.getCurrentNavIndex(navIndex: 2);
     }else {
       print('OTHER CLICK: ${controller.isHome}');
       controller.getCurrentNavIndex(navIndex: nav.navIndex);
     }
     controller.isHome = true;
     nav.isSelected = true;

     controller.update();
   },
 ));
}

/* TODO
 * TODO BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.colorAppMain,
          selectedItemColor: AppColors.colorWhite,
          unselectedItemColor: AppColors.colorWhite,
          currentIndex: controller.navIndex,
          items: _bottomNavigationBarItems(),
          onTap: (navIndex) =>
              controller.getCurrentNavIndex(navIndex: navIndex),
        )
 * */