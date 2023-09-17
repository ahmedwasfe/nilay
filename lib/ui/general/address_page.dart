import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/add_address_controller.dart';
import 'package:nilay/model/add_address.dart';
import 'package:nilay/ui/general/add_address.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

import '../home/pages/profile_page.dart';

class AddressPage extends StatelessWidget {
  final _controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(
          text: 'address',
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: REdgeInsetsDirectional.only(
                  top: 62.h, start: 22.w, end: 22.w, bottom: 48.h),
              child: GestureDetector(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [8, 7],
                  radius: Radius.circular(35.r),
                  padding:
                      EdgeInsets.symmetric(vertical: 13.h, horizontal: 102.w),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Row(
                        children: [
                          SvgPicture.asset('${Const.icons}icon_add.svg'),
                          SizedBox(
                            width: 12.w,
                          ),
                          AppText.medium(
                              text: 'add_new_address',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorAppMain)
                        ],
                      )),
                ),
                onTap: () => Get.to(AddAdressScreen()),
              ),
            ),
            _controller.listAddress.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.listAddress.length,
                    itemBuilder: (_, index) =>
                        buildAddressItem(_controller.listAddress[index]))
                : Center(
                heightFactor: 2.2,
                child: buildNoData()),
          ],
        ),
      ),
    );
  }

  Widget buildAddressItem(AddAddress address) => Column(
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(
                start: 20.w, end: 20.w, bottom: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.colorAppSub, width: 0.5.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsetsDirectional.all(10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(60.r),
                        border: Border.all(color: AppColors.colorAppSub)),
                    child: SvgPicture.asset(
                      '${Const.icons}icone_profile_home.svg',
                      fit: BoxFit.scaleDown,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: address.governorate,
                        color: AppColors.colorAppSub2,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    AppText.medium(
                        text: address.region,
                        color: AppColors.colorTextMain,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    AppText.medium(
                        text: address.street,
                        color: AppColors.colorTextMain,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    AppText.medium(
                        text: address.houseNumber,
                        color: AppColors.colorTextMain,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                SvgPicture.asset('${Const.icons}icon_map.svg')
              ],
            ),
          ),
          // SizedBox(
          //   height: 20.h,
          // )
        ],
      );

  Widget buildNoData() => NoDataItem(
    icon: '${Const.icons}icon_location.svg',
    textMain: 'no_address_yet',
    textSub: 'add_location',
  );
}
