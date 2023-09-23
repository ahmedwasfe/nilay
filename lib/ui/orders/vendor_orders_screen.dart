import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/model/test/vendors_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendor_orders/vendor_orders_item.dart';

class VendorOrdersScreen extends StatelessWidget {

  final _controller = Get.put(OrdersPageController());

  final VendorsOrders? vendorOrders;
  VendorOrdersScreen({super.key, this.vendorOrders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: vendorOrders!.name, color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.getListVendorOrderType(vendorOrders!.name).length,
          itemBuilder: (_, index) => VendorOrdersItem(order: _controller.getListVendorOrderType(vendorOrders!.name)[index]))
    );
  }
}