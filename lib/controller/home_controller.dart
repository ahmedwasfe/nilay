import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilay/model/bottom_nav_bar.dart';
import 'package:nilay/ui/home/pages/favorite_page.dart';
import 'package:nilay/ui/home/pages/home_page.dart';
import 'package:nilay/ui/home/pages/messages_page.dart';
import 'package:nilay/ui/home/pages/my_orders_page.dart';
import 'package:nilay/ui/home/pages/profile_page.dart';
import 'package:nilay/utils/constants.dart';

class HomeController extends GetxController {
  int navIndex = 2;
  String pageSelected = '${Const.icons}icon_home.svg';
  bool isHome = false;

  List<Widget> screens = [
    const ProfilePage(),
    FavoritePage(),
    HomePage(),
    MyOrdersPage(),
    MessagesPage(),
  ];

  List<BottomNavItem> bottomNavItems = [
    BottomNavItem(navIndex: 0, name: 'profile', icon: '${Const.icons}icon_profile.svg', isSelected: false),
    BottomNavItem(navIndex: 1, name: 'favorite', icon: '${Const.icons}icon_favorite.svg', isSelected: false),
    BottomNavItem(navIndex: 2, name: 'home', icon: '${Const.icons}icon_home.svg', isSelected: false),
    BottomNavItem(navIndex: 3, name: 'my_orders', icon: '${Const.icons}icon_my_orders.svg', isSelected: false),
    BottomNavItem(navIndex: 4, name: 'messages', icon: '${Const.icons}icon_messages.svg', isSelected: false),
  ];

  void getCurrentNavIndex({required int navIndex}) {
    this.navIndex = navIndex;
    update();
  }
}
