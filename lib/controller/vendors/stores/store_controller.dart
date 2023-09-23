import 'package:get/get.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/model/test/colors.dart';
import 'package:nilay/model/test/product.dart';
import 'package:nilay/model/test/sizes.dart';
import 'package:nilay/model/test/slider.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/constants.dart';

class StoreController extends GetxController {

  List<SliderData> listSlider = [
    SliderData(image: Const.storeSlider1),
    SliderData(image: Const.storeSlider2),
    SliderData(image: Const.storeSlider3),
    SliderData(image: Const.storeSlider4),
    SliderData(image: Const.storeSlider5),
    SliderData(image: Const.storeSlider6),
  ];

  List<Categories> listCategories = [
    Categories(id: 1, name: 'Fashions', image: Const.imageFashions, isSelected: true),
    Categories(id: 2, name: 'Bottoms', image: Const.imageBottoms, isSelected: false),
    Categories(id: 3, name: 'Swimwear', image: Const.imageSwimwear, isSelected: false),
    Categories(id: 4, name: 'Dress', image: Const.imageDress, isSelected: false),
    Categories(id: 5, name: 'Plus size', image: Const.imagePlusSize, isSelected: false),
  ];

  List<VendorData> listTopFiveStores = [
    VendorData(name: 'karmen Store', image: Const.storeOrder1, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Loran Store', image: Const.storeOrder9, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD, vendorType: Const.KEY_VENDOR_STORE,isFavorite: true),
    VendorData(name: 'Re Store', image: Const.storeOrder3, rate: '+3', membership: Const.KEY_MEMBERSHIP_BRONZE,vendorType: Const.KEY_VENDOR_STORE, isFavorite: false),
    VendorData(name: 'Art Store', image: Const.storeOrder12, rate: '+5', membership: Const.KEY_MEMBERSHIP_GOLD,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
    VendorData(name: 'Hala Store', image: Const.storeOrder13, rate: '+4', membership: Const.KEY_MEMBERSHIP_SILVER,vendorType: Const.KEY_VENDOR_STORE, isFavorite: true),
  ];

  List<Product> listProducts = [
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder1,
        price: 20,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorBlack, isSeleced: true),
          ProductColor(color: AppColors.colorWhite, isSeleced: false),
          ProductColor(color: AppColors.colorOnline, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: false),
          ProductSize(size: 'S', isSelected: true),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
          ProductSize(size: 'XXXL', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder2,
        price: 88,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorOtherText1, isSeleced: true),
          ProductColor(color: AppColors.colorOtherText, isSeleced: false),
          ProductColor(color: AppColors.colorErrorText, isSeleced: false),
          ProductColor(color: AppColors.colorBoarding3, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: true),
          ProductSize(size: 'XL', isSelected: false),
        ],
        isFavorite: false),
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder3,
        price: 90,
        colors: <ProductColor>[
          ProductColor(color: AppColors.lightBlue, isSeleced: true),
          ProductColor(color: AppColors.lightBlue4, isSeleced: false),
          ProductColor(color: AppColors.lightBlue7, isSeleced: false),
          ProductColor(color: AppColors.lightYellow, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'S', isSelected: true),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder4,
        price: 30,
        colors: <ProductColor>[
          ProductColor(color: AppColors.lightYellow, isSeleced: false),
          ProductColor(color: AppColors.colorAppSub2, isSeleced: true),
          ProductColor(color: AppColors.formSearchColor, isSeleced: false),
          ProductColor(color: AppColors.colorSuccessBG1, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'XL', isSelected: true),
          ProductSize(size: 'XXL', isSelected: false),
        ],
        isFavorite: false),
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder5,
        price: 205,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorErrorBG, isSeleced: false),
          ProductColor(color: AppColors.colorErrorText, isSeleced: true),
          ProductColor(color: AppColors.colorSnackBarIconError, isSeleced: false),
          ProductColor(color: AppColors.colorSnackBaErrorColor, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: false),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: true),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
          ProductSize(size: 'XXXL', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storesHomeSlider1,
        price: 30,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorTextSub, isSeleced: false),
          ProductColor(color: AppColors.colorTextSub2, isSeleced: true),
          ProductColor(color: AppColors.colorTextSub5, isSeleced: false),
          ProductColor(color: AppColors.colorTextUnSelected, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
          ProductColor(color: AppColors.coloSelectEmailPhoneIconBG, isSeleced: false),
          ProductColor(color: AppColors.colorGray1, isSeleced: false),
          ProductColor(color: AppColors.colorLine, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: true),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress2',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storesHomeSlider2,
        price: 10,
        colors: <ProductColor>[
          ProductColor(color: AppColors.lightGray, isSeleced: false),
          ProductColor(color: AppColors.lightBlack, isSeleced: true),
          ProductColor(color: AppColors.lightBlue, isSeleced: false),
          ProductColor(color: AppColors.lightBlue4, isSeleced: false),
          ProductColor(color: AppColors.lightBlue5, isSeleced: false),
          ProductColor(color: AppColors.lightBlue6, isSeleced: false),
          ProductColor(color: AppColors.lightBlue7, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
          ProductColor(color: AppColors.lightWhite, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
          ProductSize(size: 'XXXL', isSelected: false),
        ],
        isFavorite: false),
    Product(
        name: 'Casual Dress3',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder10,
        price: 30,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorTextSub, isSeleced: false),
          ProductColor(color: AppColors.colorTextSub2, isSeleced: true),
          ProductColor(color: AppColors.colorTextSub5, isSeleced: false),
          ProductColor(color: AppColors.colorTextUnSelected, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
          ProductColor(color: AppColors.coloSelectEmailPhoneIconBG, isSeleced: false),
          ProductColor(color: AppColors.colorGray1, isSeleced: false),
          ProductColor(color: AppColors.colorLine, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: true),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress4',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder9,
        price: 50,
        colors: <ProductColor>[
          ProductColor(color: AppColors.colorErrorBG, isSeleced: false),
          ProductColor(color: AppColors.colorErrorText, isSeleced: true),
          ProductColor(color: AppColors.colorSnackBarIconError, isSeleced: false),
          ProductColor(color: AppColors.colorSnackBaErrorColor, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
        ],
        isFavorite: false),
    Product(
        name: 'Casual Dress5',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storeOrder11,
        price: 40,
        colors: <ProductColor>[
          ProductColor(color: AppColors.lightYellow, isSeleced: false),
          ProductColor(color: AppColors.colorAppSub2, isSeleced: true),
          ProductColor(color: AppColors.formSearchColor, isSeleced: false),
          ProductColor(color: AppColors.colorSuccessBG1, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
        ],
        isFavorite: true),
    Product(
        name: 'Casual Dress6',
        title: 'Casual',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        image: Const.storesHomeSlider6,
        price: 800,
        colors: <ProductColor>[
          ProductColor(color: AppColors.lightGray, isSeleced: false),
          ProductColor(color: AppColors.lightBlack, isSeleced: true),
          ProductColor(color: AppColors.lightBlue, isSeleced: false),
          ProductColor(color: AppColors.lightBlue4, isSeleced: false),
          ProductColor(color: AppColors.lightBlue5, isSeleced: false),
          ProductColor(color: AppColors.lightBlue6, isSeleced: false),
          ProductColor(color: AppColors.lightBlue7, isSeleced: false),
          ProductColor(color: AppColors.lightRed, isSeleced: false),
          ProductColor(color: AppColors.lightWhite, isSeleced: false),
        ],
        sizes: <ProductSize>[
          ProductSize(size: 'XS', isSelected: true),
          ProductSize(size: 'S', isSelected: false),
          ProductSize(size: 'M', isSelected: false),
          ProductSize(size: 'L', isSelected: false),
          ProductSize(size: 'XL', isSelected: false),
          ProductSize(size: 'XXL', isSelected: false),
          ProductSize(size: 'XXXL', isSelected: false),
        ],
        isFavorite: true),
  ];

}