import 'package:get/get.dart';
import 'package:nilay/model/test/slider.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/constants.dart';

class BeautyCentersController extends GetxController {

  List<SliderData> listSlider = [
    SliderData(image: Const.beautyHomeSlider1),
    SliderData(image: Const.beautyHomeSlider2),
    SliderData(image: Const.beautyHomeSlider3),
    SliderData(image: Const.beautyHomeSlider4),
    SliderData(image: Const.beautyHomeSlider5),
    SliderData(image: Const.beautyHomeSlider6),
  ];

  List<VendorData> listTopFive = [
    VendorData(name: 'Lila Salon', image: Const.topFiveCenters1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Zohra Salon', image: Const.topFiveCenters2, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Lina Salon', image: Const.topFiveCenters3, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Roza Center', image: Const.topFiveCenters4, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Center', image: Const.topFiveCenters5, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
  ];

  List<VendorData> listAllCenters = [
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters2, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters3, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters4, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters5, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Rivan Salon', image: Const.topFiveCenters6, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Lila Salon', image: Const.topFiveCenters7, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Roza Salon', image: Const.topFiveCenters8, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Lina Salon', image: Const.topFiveCenters9, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Zohra Center', image: Const.topFiveCenters10, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters11, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters12, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters13, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters14, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters15, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters16, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
    VendorData(name: 'Lila Center', image: Const.topFiveCenters17, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: false),
  ];

}