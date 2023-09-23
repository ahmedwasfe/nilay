import 'package:get/get.dart';
import 'package:nilay/model/test/services.dart';
import 'package:nilay/model/test/slider.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/constants.dart';

class HomePageController extends GetxController{

  List<SliderData> listSlider = [
    SliderData(image: Const.sliderImage),
    SliderData(image: Const.imageBeautifulCenter),
    SliderData(image: Const.imagePhotoSession),
    SliderData(image: Const.imageStore),
    SliderData(image: Const.imageWeddingDress),
    SliderData(image: Const.imageWeddingHalls),
  ];

  List<Services> listServices = [
    Services(id: 1, name: 'stores_'.tr, image: Const.imageStore),
    Services(id: 2, name: 'wedding_halls'.tr, image: Const.imageWeddingHalls),
    Services(id: 3, name: 'beauty_centers'.tr, image: Const.imageBeautifulCenter),
    Services(id: 4, name: 'photo_sessiones'.tr, image: Const.imagePhotoSession),
    Services(id: 5, name: 'wedding_dress'.tr, image: Const.imageWeddingDress),
  ];

  List<VendorData> listTopVendors = [
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hevines halls', image: Const.imageHevinesHalls, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_HALL, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_PHOTO_SESSION, isFavorite: true),
    VendorData(name: 'Loran Salon', image: Const.imageLoranSalon, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
  ];

  List<VendorData> listVendorsRecent = [
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_PHOTO_SESSION, isFavorite: true),
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Loran Salon', image: Const.imageLoranSalon, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'SOO Dress', image: Const.imageOrdersDress7, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_DRESS, isFavorite: false),
    VendorData(name: 'Mera Dress', image: Const.imageOrdersDress4, rate: '+2', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_DRESS, isFavorite: false),

  ];

}