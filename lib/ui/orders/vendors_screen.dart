import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/orders_page_controller.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/widget/vendor_orders/vendors_item.dart';

class VendorsScreen extends StatelessWidget {

  final _controller = Get.put(OrdersPageController());

  final VendorsOrders? vendor;
  VendorsScreen({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: vendor!.name, color: AppColors.colorAppMain),
        centerTitle: true,
        leading: InkWell(
          child: SvgPicture.asset(
              AppHelper.iconBack(), fit: BoxFit.scaleDown),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: _controller.getListVendorType(vendor!.name).length,
          itemBuilder: (_, index) => VendorItem(vendor: _controller.getListVendorType(vendor!.name)[index])),
    );
  }
}