import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/model/orders/store_orders.dart';
import 'package:nilay/model/vendors_orders.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class OrdersPageController extends GetxController{

  // TODO VENDORS
  List<VendorsOrders> getListVendorType(String name){
    if(name == 'stores'.tr) {
      return listStoresVendors;
    }else if(name == 'halls'.tr){
      return listHallVendors;
    }else if(name == 'dresss'.tr){
      return listDressVendors;
    }else if(name == 'beauty_centers'.tr){
      return listBeuatyCenterVendors;
    }else if(name == 'photo_sessions'.tr){
      return listPhotoSesstionsVendors;
    }else{
      return [];
    }
  }

  List<VendorsOrders> listVendorsOrders = [
    VendorsOrders(name: 'stores'.tr, image: Const.imageWomanPayingClothes),
    VendorsOrders(name: 'halls'.tr, image: Const.imageWeddingHalls),
    VendorsOrders(name: 'dresss'.tr, image: Const.imageWeddingDress),
    VendorsOrders(name: 'beauty_centers'.tr, image: Const.imageWomanCosmetologistMakingBeautyProcedures),
    VendorsOrders(name: 'photo_sessions'.tr, image: Const.imageCoupleMarriagePhotoSession),
  ];

  List<VendorsOrders> listStoresVendors = [
    VendorsOrders(name: 'Karmen Store', image: Const.imageOrdersStore1),
    VendorsOrders(name: 're:Store', image: Const.imageOrdersStore2),
    VendorsOrders(name: 'Click Store', image: Const.imageOrdersStore3),
    VendorsOrders(name: 'Perfect Store', image: Const.imageOrdersStore4),
    VendorsOrders(name: 'Nora Store', image: Const.imageOrdersStore5),
  ];

  List<VendorsOrders> listHallVendors = [
    VendorsOrders(name: 'Karmen Hall', image: Const.imageOrdersHall1),
    VendorsOrders(name: 'Neven Hall', image: Const.imageOrdersHall2),
    VendorsOrders(name: 'Click Hall', image: Const.imageOrdersHall3),
    VendorsOrders(name: 'Perfect Hall', image: Const.imageOrdersHall4),
    VendorsOrders(name: 'Nora Hall', image: Const.imageOrdersHall5),
  ];

  List<VendorsOrders> listDressVendors = [
    VendorsOrders(name: 'Karmen Dress', image: Const.imageOrdersDress1),
    VendorsOrders(name: 'Neven Dress', image: Const.imageOrdersDress2),
    VendorsOrders(name: 'Click Dress', image: Const.imageOrdersDress3),
    VendorsOrders(name: 'Perfect Dress', image: Const.imageOrdersDress4),
    VendorsOrders(name: 'Nora Dress', image: Const.imageOrdersDress5),
    VendorsOrders(name: 'Karmen Dress', image: Const.imageOrdersDress6),
    VendorsOrders(name: 'Neven Dress', image: Const.imageOrdersDress7),
    VendorsOrders(name: 'Click Dress', image: Const.imageOrdersDress8),
    VendorsOrders(name: 'Perfect Dress', image: Const.imageOrdersDress9),
    VendorsOrders(name: 'Nora Dress', image: Const.imageOrdersDress10),
  ];

  List<VendorsOrders> listBeuatyCenterVendors = [
    VendorsOrders(name: 'Karmen BeutyCenter', image: Const.imageOrdersBeutyCenter1),
    VendorsOrders(name: 'Neven BeutyCenter', image: Const.imageOrdersBeutyCenter2),
    VendorsOrders(name: 'Click BeutyCenter', image: Const.imageOrdersBeutyCenter3),
    VendorsOrders(name: 'Perfect BeutyCenter', image: Const.imageOrdersBeutyCenter4),
    VendorsOrders(name: 'Nora BeutyCenter', image: Const.imageOrdersBeutyCenter5),
    VendorsOrders(name: 'Karmen BeutyCenter', image: Const.imageOrdersBeutyCenter6),
    VendorsOrders(name: 'Neven BeutyCenter', image: Const.imageOrdersBeutyCenter7),
    VendorsOrders(name: 'Click BeutyCenter', image: Const.imageOrdersBeutyCenter8),
    VendorsOrders(name: 'Perfect BeutyCenter', image: Const.imageOrdersBeutyCenter9),
    VendorsOrders(name: 'Nora BeutyCenter', image: Const.imageOrdersBeutyCenter10),
    VendorsOrders(name: 'Faal BeutyCenter', image: Const.imageOrdersBeutyCenter11),
  ];

  List<VendorsOrders> listPhotoSesstionsVendors = [
    VendorsOrders(name: 'Karmen PhotoSession', image: Const.imageOrdersPhotoSession1),
    VendorsOrders(name: 'Neven PhotoSession', image: Const.imageOrdersPhotoSession2),
    VendorsOrders(name: 'Click PhotoSession', image: Const.imageOrdersPhotoSession3),
    VendorsOrders(name: 'Perfect PhotoSession', image: Const.imageOrdersPhotoSession4),
    VendorsOrders(name: 'Nora PhotoSession', image: Const.imageOrdersPhotoSession5),
    VendorsOrders(name: 'Karmen PhotoSession', image: Const.imageOrdersPhotoSession6),
    VendorsOrders(name: 'Neven PhotoSession', image: Const.imageOrdersPhotoSession7),
    VendorsOrders(name: 'Click PhotoSession', image: Const.imageOrdersPhotoSession8),
    VendorsOrders(name: 'Perfect PhotoSession', image: Const.imageOrdersPhotoSession9),
    VendorsOrders(name: 'Nora PhotoSession', image: Const.imageOrdersPhotoSession10),
    VendorsOrders(name: 'Faal PhotoSession', image: Const.imageOrdersPhotoSession11),
    VendorsOrders(name: 'Karmen PhotoSession', image: Const.imageOrdersPhotoSession12),
    VendorsOrders(name: 'Neven PhotoSession', image: Const.imageOrdersPhotoSession13),
    VendorsOrders(name: 'Click PhotoSession', image: Const.imageOrdersPhotoSession14),
    VendorsOrders(name: 'Perfect PhotoSession', image: Const.imageOrdersPhotoSession15),
    VendorsOrders(name: 'Nora PhotoSession', image: Const.imageOrdersPhotoSession16),
    VendorsOrders(name: 'Karmen PhotoSession', image: Const.imageOrdersPhotoSession17),
    VendorsOrders(name: 'Neven PhotoSession', image: Const.imageOrdersPhotoSession18),
    VendorsOrders(name: 'Click PhotoSession', image: Const.imageOrdersPhotoSession19),
  ];

  // TODO ORDERS
  List<Orders> getListVendorOrderType(String name){
    if(name.contains('Store'.tr)) {
      return listStoreOrders;
    }else if(name.contains('Hall'.tr)){
      return listHallOrders;
    }else if(name.contains('Dress'.tr)){
      return listDressOrders;
    }else if(name.contains('BeutyCenter'.tr)){
      return listBeuatyCenterOrders;
    }else if(name.contains('PhotoSession'.tr)){
      return listPhotoSesstionsOrders;
    }else{
      return [];
    }
  }

  List<Orders> listStoreOrders = [
  Orders(
      image: Const.storeOrder1,
      name: 'Short blouse 1',
      size: 'XL',
      color: Colors.black,
      date: '15/09/2023',
      time: '3:00 AM',
      price: '500\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder2,
      name: 'Short blouse 2',
      size: 'M, L',
      color: Colors.white,
      date: '15/09/2023',
      time: '3:08 PM',
      price: '800\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder3,
      name: 'ًWoman dress',
      size: 'S, M, L',
      color: Colors.deepPurpleAccent,
      date: '14/09/2023',
      time: '5:08 PM',
      price: '1000\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder4,
      name: 'Blouse',
      size: 'S, M, XL',
      color: Colors.white,
      date: '18/09/2023',
      time: '8:08 PM',
      price: '200\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder5,
      name: 'Shirt 2',
      size: 'S, M',
      color: AppColors.colorShirt1,
      date: '16/09/2023',
      time: '4:08 PM',
      price: '100\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder6,
      name: 'Shirt 3',
      size: 'S, M, L',
      color: AppColors.colorShirt2,
      date: '20/09/2023',
      time: '4:30 PM',
      price: '150\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder7,
      name: 'Shirt 4',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '20/09/2023',
      time: '4:40 PM',
      price: '250\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder8,
      name: 'Shirt 5',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder9,
      name: 'Makeup 1',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder10,
      name: 'Makeup 2',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder11,
      name: 'Makeup 3',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder12,
      name: 'Makeup 4',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder13,
      name: 'Makeup 5',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder14,
      name: 'Makeup 6',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder15,
      name: 'Makeup 7',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder16,
      name: 'Makeup 8',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder17,
      name: 'Makeup 9',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder18,
      name: 'Makeup 10',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder19,
      name: 'Makeup 11',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder20,
      name: 'Makeup 12',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder21,
      name: 'Makeup 13',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),
  Orders(
      image: Const.storeOrder22,
      name: 'Makeup 14',
      size: 'M',
      color: AppColors.colorShirt2,
      date: '22/09/2023',
      time: '8:40 PM',
      price: '300\$',
      vendorType: Const.KEY_VENDOR_STORE),

];

  List<Orders> listHallOrders = [
    Orders(
        image: Const.imageOrdersHall5,
        name: 'Hall 1',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_HALL),
    Orders(
        image: Const.imageOrdersHall4,
        name: 'Hall 2',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_HALL),
    Orders(
        image: Const.imageOrdersHall3,
        name: 'Hall 3',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_HALL),
    Orders(
        image: Const.imageOrdersHall2,
        name: 'Hall 4',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_HALL),
    Orders(
        image: Const.imageOrdersHall1,
        name: 'Hall 5',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_HALL),
  ];

  List<Orders> listDressOrders = [
    Orders(
        image: Const.imageOrdersDress10,
        name: 'Dress 1',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress9,
        name: 'Dress 2',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress8,
        name: 'Dress 3',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress7,
        name: 'Dress 4',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress6,
        name: 'Dress 5',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress5,
        name: 'Dress 7',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress4,
        name: 'Dress 8',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress3,
        name: 'Dress 9',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress2,
        name: 'Dress 10',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersDress1,
        name: 'Dress 11',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
  ];

  List<Orders> listBeuatyCenterOrders = [
    Orders(
        image: Const.imageOrdersBeutyCenter11,
        name: 'BeutyCenter 1',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter10,
        name: 'BeutyCenter 2',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter9,
        name: 'BeutyCenter 3',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter8,
        name: 'BeutyCenter 4',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter7,
        name: 'BeutyCenter 5',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter6,
        name: 'BeutyCenter 6',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter5,
        name: 'BeutyCenter 7',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter4,
        name: 'BeutyCenter 8',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter3,
        name: 'BeutyCenter 9',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter2,
        name: 'BeutyCenter 10',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
    Orders(
        image: Const.imageOrdersBeutyCenter1,
        name: 'BeutyCenter 11',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_DRESS),
  ];

  List<Orders> listPhotoSesstionsOrders = [
    Orders(
        image: Const.imageOrdersPhotoSession19,
        name: 'Photo Session 1',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession18,
        name: 'Photo Session 2',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession17,
        name: 'Photo Session 3',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession16,
        name: 'Photo Session 4',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession15,
        name: 'Photo Session 5',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession14,
        name: 'Photo Session 6',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession13,
        name: 'Photo Session 7',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession12,
        name: 'Photo Session 8',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession11,
        name: 'Photo Session 9',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession10,
        name: 'Photo Session 10',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession9,
        name: 'Photo Session 11',
        size: 'XL',
        color: Colors.black,
        date: '15/09/2023',
        time: '3:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession8,
        name: 'Photo Session 12',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:00 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession7,
        name: 'Photo Session 13',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession6,
        name: 'Photo Session 14',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:43 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession5,
        name: 'Photo Session 15',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession4,
        name: 'Photo Session 16',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession3,
        name: 'Photo Session 17',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession2,
        name: 'Photo Session 18',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
    Orders(
        image: Const.imageOrdersPhotoSession1,
        name: 'Photo Session 19',
        size: 'XL',
        color: Colors.black,
        date: '16/09/2023',
        time: '12:42 AM',
        price: '500\$',
        vendorType: Const.KEY_VENDOR_PHOTO_SESSION),
  ];

  void showDeleteOrderDialog(BuildContext context, Orders order) {
    showDialog(context: context,
        builder: (_) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            width: double.infinity,
            height: 235.h,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadiusDirectional.circular(20.r)
           ),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsetsDirectional.only(top: 22.r),
                    child: AppText.medium(text: 'Delete Order', color: AppColors.colorAppMain)),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 16.r, top: 16.r, end: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText.medium(text: order.name, color: AppColors.colorAppMain, fontWeight: FontWeight.w400),
                        SizedBox(height: 16.h),
                        order.vendorType == Const.KEY_VENDOR_STORE
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                AppText.medium(text: 'size', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                SizedBox(width: 2.r),
                                AppText.medium(text: order.size, color: AppColors.colorBlack, fontWeight: FontWeight.w400, fontSize: 14.sp),
                              ],
                            ),
                            SizedBox(width: 16.h),
                            Row(
                              children: [
                                AppText.medium(text: 'color', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 14.sp),
                                SizedBox(width: 2.r),
                                Container(
                                  width: 14.w,
                                  height: 14.h,
                                  decoration: BoxDecoration(
                                      color: order.color,
                                      borderRadius: BorderRadiusDirectional.circular(50.r),
                                      boxShadow: [
                                        // TODO Offset(START, BOTTOM)
                                        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                                      ]
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                            : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText.medium(text: 'date', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                                SizedBox(width: 2.r),
                                AppText.medium(text: order.date, color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText.medium(text: 'time', color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                                SizedBox(width: 2.r),
                                AppText.medium(text: order.time, color: AppColors.colorTextSub6, fontWeight: FontWeight.w400, fontSize: 12.sp),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText.medium(text: 'Price: ', color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                            AppText.medium(text: order.price, color: AppColors.colorAppMain, fontWeight: FontWeight.w400, fontSize: 14.sp),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            AppWidgets.CustomButton(
                                text: 'Cancel',
                                width: 160.w,
                                height: 48.h,
                                background: AppColors.colorErrorBG,
                                click: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}