import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/stores/products_controller.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/stores/product/product_item.dart';
import 'package:nilay/widget/vendors/stores/slider_home_stores_item.dart';

class ProductsScreen extends StatelessWidget {

  String? name;
  String? type;

  ProductsScreen({this.name, this.type, super.key});

  final _controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: name!, color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 12.r),
            child: SvgPicture.asset(
                width: 24.w, height: 24.h, '${Const.icons}icon_chat.svg'),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 28.r),
              child: SvgPicture.asset(
                  width: 24.w, height: 24.h, '${Const.icons}icon_cart.svg'),
            ),
            onTap: () => Get.toNamed(Routes.cartStores),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 28.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: const Radius.circular(32).r,
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'search'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.lightGray, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.colorBlack, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 48.h,
                      minWidth: 48.w,
                    ),
                    prefixIcon: SvgPicture.asset(
                        '${Const.icons}icon_search.svg',
                        fit: BoxFit.scaleDown),
                    suffixIcon: SvgPicture.asset(
                        '${Const.icons}icon_filter.svg',
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin:
              EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 30.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              child: ImageSlideshow(
                width: 360,
                height: 195,
                initialPage: 0,
                indicatorRadius: 5,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                autoPlayInterval: 5000,
                isLoop: true,
                children: _controller.listSlider
                    .map((silder) => SliderHomeStoresItem(slider: silder))
                    .toList(),
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: Row(
                children: [
                  Expanded(
                      child: AppText.medium(
                          text: type!, color: AppColors.colorAppMain)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: 30.r, start: 14.r, end: 14.r, bottom: 0.r),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.listProducts.length,
                  gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 16.r,
                    childAspectRatio: 108.r / 150.r,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => ProductItem(product: _controller.listProducts[index])),
            )
          ],
        ),
      ),
    );
  }
}