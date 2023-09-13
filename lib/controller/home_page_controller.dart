import 'package:get/get.dart';
import 'package:nilay/model/services.dart';
import 'package:nilay/model/slider.dart';
import 'package:nilay/model/vendor_data.dart';
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
    Services(name: 'Stores', image: Const.imageStore),
    Services(name: ' Wedding halls', image: Const.imageWeddingHalls),
    Services(name: ' Beauty centers', image: Const.imageBeautifulCenter),
    Services(name: 'photo session', image: Const.imagePhotoSession),
    Services(name: 'Wedding Dress', image: Const.imageWeddingDress),
  ];

  List<VendorData> listVendors = [
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: false),
    VendorData(name: 'Hevines halls', image: Const.imageHevinesHalls, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: false),
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'Loran Salon', image: Const.imageLoranSalon, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: true),
  ];

  List<VendorData> listVendorsRecent = [
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: false),
    VendorData(name: 'Loran Salon', image: Const.imageLoranSalon, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: false),

  ];

}