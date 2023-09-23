import 'package:get/get.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/model/test/slider.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/constants.dart';

class HomeStoresController extends GetxController {

  List<SliderData> listSlider = [
    SliderData(image: Const.storesHomeSlider1),
    SliderData(image: Const.storesHomeSlider2),
    SliderData(image: Const.storesHomeSlider3),
    SliderData(image: Const.storesHomeSlider4),
    SliderData(image: Const.storesHomeSlider5),
    SliderData(image: Const.storesHomeSlider6),
  ];

  List<Categories> listCategories = [
    Categories(id: 1, name: 'Clothes', image: Const.storesHomeCategory1, isSelected: true),
    Categories(id: 2, name: 'Makeup', image: Const.storesHomeCategory2, isSelected: false),
    Categories(id: 3, name: 'Accessories', image: Const.storesHomeCategory3, isSelected: false),
    Categories(id: 4, name: 'Skin care', image: Const.storesHomeCategory4, isSelected: false),
    Categories(id: 5, name: 'hygiene ', image: Const.storesHomeCategory5, isSelected: false),
  ];

  List<VendorData> listTopFiveStores = [
    VendorData(name: 'karmen Store', image: Const.storeOrder1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Loran Store', image: Const.storeOrder9, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Re Store', image: Const.storeOrder3, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Art Store', image: Const.storeOrder12, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder13, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
  ];

  List<VendorData> listStores = [
    VendorData(name: 'Hala Store', image: Const.storeOrder16, rate: '+1', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder20, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Re Store', image: Const.storeOrder3, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder13, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder2, rate: '+2', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Art Store', image: Const.storeOrder12, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder6, rate: '+3', membership: Const.KEY_MEMBERSHIP_SILVER, vendorType: Const.KEY_VENDOR_STORE,isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder7, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder10, rate: '+4', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'karmen Store', image: Const.storeOrder1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Loran Store', image: Const.storeOrder9, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
  ];

  List<VendorData> listAllStores = [
    VendorData(name: 'Hala Store', image: Const.storeOrder16, rate: '+1', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder20, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Re Store', image: Const.storeOrder3, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder13, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder2, rate: '+2', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Art Store', image: Const.storeOrder12, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder6, rate: '+3', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Hala Store', image: Const.storeOrder7, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_STORE,isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder10, rate: '+4', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'karmen Store', image: Const.storeOrder1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Loran Store', image: Const.storeOrder9, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder11, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder5, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder4, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder8, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder14, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder15, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder17, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder18, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder19, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder21, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Loran Store', image: Const.storeOrder22, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
  ];

}