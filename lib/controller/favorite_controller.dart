import 'package:get/get.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/constants.dart';

class FavoriteController extends GetxController{

  List<VendorData> listTopFavorites = [
    VendorData(name: 'Lila Salon', image: Const.imageWomanCosmetologistMakingBeautyProcedures, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Zohra Salon', image: Const.imageSmilingWomanAppliesEyeHairCurlers, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Royal Center', image: Const.imageRoyalCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER, isFavorite: true),
    VendorData(name: 'Royal Dress Center', image: Const.imageOrdersDress9, rate: '+4', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_DRESS, isFavorite: true),
  ];

  List<VendorData> listFavorites = [
    VendorData(name: 'Woman Paying Clothes', image: Const.imageWomanPayingClothes, rate: '+4', membership: Const.KEY_MEMBERSHIP_BRONZE, vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Marriage Photo Session', image: Const.imageCoupleMarriagePhotoSession, rate: '+4', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_PHOTO_SESSION, isFavorite: true),
    VendorData(name: 'karmen store', image: Const.imageKarmenStore, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Roze Center', image: Const.imageRozeCenter, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE, vendorType: Const.KEY_VENDOR_BEAUTY_CENTER,isFavorite: true),
    VendorData(name: 'Lamar Studio', image: Const.imageLamarStudio, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_PHOTO_SESSION, isFavorite: true),
    VendorData(name: 'Hevines halls', image: Const.imageHevinesHalls, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_HALL, isFavorite: true),
    VendorData(name: 'BE Dress', image: Const.imageOrdersDress10, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_DRESS, isFavorite: true),

  ];
}