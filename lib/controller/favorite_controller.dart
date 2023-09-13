import 'package:get/get.dart';
import 'package:nilay/model/vendor_data.dart';
import 'package:nilay/utils/constants.dart';

class FavoriteController extends GetxController{

  List<VendorData> listTopFavorites = [
    VendorData(name: 'Lila Salon', image: Const.imageWomanCosmetologistMakingBeautyProcedures, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: true),
    VendorData(name: 'Zohra Salon', image: Const.imageSmilingWomanAppliesEyeHairCurlers, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'Royal Center', image: Const.imageRoyalCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: true),
  ];

  List<VendorData> listFavorites = [
    VendorData(name: 'Woman Paying Clothes', image: Const.imageWomanPayingClothes, rate: '+4', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: true),
    VendorData(name: 'Marriage Photo Session', image: Const.imageCoupleMarriagePhotoSession, rate: '+4', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: true),
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, isFavorite: true),
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'Hevines halls', image: Const.imageHevinesHalls, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, isFavorite: true),
    VendorData(name: 'Loran Salon', image: Const.imageLoranSalon, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, isFavorite: true),

  ];
}