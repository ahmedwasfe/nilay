import 'package:get/get.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/utils/constants.dart';

class OrdersPageController extends GetxController{

  List<VendorsOrders> listVendorsOrders = [
    VendorsOrders(name: 'stores'.tr, image: Const.imageWomanPayingClothes),
    VendorsOrders(name: 'halls'.tr, image: Const.imageWeddingHalls),
    VendorsOrders(name: 'dresss'.tr, image: Const.imageWeddingDress),
    VendorsOrders(name: 'beuty_centers'.tr, image: Const.imageWomanCosmetologistMakingBeautyProcedures),
    VendorsOrders(name: 'photo_sessions'.tr, image: Const.imageCoupleMarriagePhotoSession),
  ];

  List<VendorsOrders> listVendors = [
    VendorsOrders(name: 'stores'.tr, image: Const.imageWomanPayingClothes),
    VendorsOrders(name: 'halls'.tr, image: Const.imageWeddingHalls),
    VendorsOrders(name: 'dresss'.tr, image: Const.imageWeddingDress),
    VendorsOrders(name: 'beuty_centers'.tr, image: Const.imageWomanCosmetologistMakingBeautyProcedures),
    VendorsOrders(name: 'photo_sessions'.tr, image: Const.imageCoupleMarriagePhotoSession),
    VendorsOrders(name: 'stores'.tr, image: Const.imageWomanPayingClothes),
    VendorsOrders(name: 'halls'.tr, image: Const.imageWeddingHalls),
    VendorsOrders(name: 'dresss'.tr, image: Const.imageWeddingDress),
    VendorsOrders(name: 'beuty_centers'.tr, image: Const.imageWomanCosmetologistMakingBeautyProcedures),
    VendorsOrders(name: 'photo_sessions'.tr, image: Const.imageCoupleMarriagePhotoSession),
  ];

}