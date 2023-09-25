import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/beauty_center_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/all_services_vendor_item.dart';
import 'package:nilay/widget/vendors/services_vendor_item.dart';

class BeautyCenterServicesScreen extends StatelessWidget {
  BeautyCenterServicesScreen({super.key});

  final _controller = Get.put(BeautyCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'services', color: AppColors.colorAppMain),
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
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: SvgPicture.asset(
                width: 24.w, height: 24.h, '${Const.icons}icon_chat.svg'),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(
            top: 30.r, start: 14.r, end: 14.r, bottom: 0.r),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.listServices.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 16.r,
              childAspectRatio: 120.r / 150.r,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => AllServicesVendorItem(services: _controller.listServices[index])),
      )
    );
  }
}
