import 'package:get/get.dart';
import 'package:nilay/bindings/forget_password_bindings.dart';
import 'package:nilay/bindings/signin_bindings.dart';
import 'package:nilay/bindings/signup_bindings.dart';
import 'package:nilay/ui/auth/forget_password/congratulations_screen.dart';
import 'package:nilay/ui/auth/forget_password/new_password_screen.dart';
import 'package:nilay/ui/auth/forget_password/select_email_phone_screen.dart';
import 'package:nilay/ui/auth/forget_password/send_code_screen.dart';
import 'package:nilay/ui/auth/forget_password/verification_code_screen.dart';
import 'package:nilay/ui/auth/signin_screen.dart';
import 'package:nilay/ui/auth/signup_screen.dart';
import 'package:nilay/ui/boarding_screen.dart';
import 'package:nilay/ui/chat/chat_screen.dart';
import 'package:nilay/ui/filter/filter_all_products_screen.dart';
import 'package:nilay/ui/filter/filter_all_stores_screen.dart';
import 'package:nilay/ui/general/address/add_address_screen.dart';
import 'package:nilay/ui/general/address/addresses_screen.dart';
import 'package:nilay/ui/general/notifications_screen.dart';
import 'package:nilay/ui/general/personal_info_screen.dart';
import 'package:nilay/ui/home/home_screen.dart';
import 'package:nilay/ui/language_screen.dart';
import 'package:nilay/ui/orders/vendor_orders_screen.dart';
import 'package:nilay/ui/orders/vendors_screen.dart';
import 'package:nilay/ui/splash_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/all_beauty_centers_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/beauty_centers_services_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/beauty_center_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/home_beauty_centers_screen.dart';
import 'package:nilay/ui/vendors/recent_visited_screen.dart';
import 'package:nilay/ui/vendors/stores/all_stores_screen.dart';
import 'package:nilay/ui/vendors/stores/cart/cart_orders_screen.dart';
import 'package:nilay/ui/vendors/stores/cart/cart_stores_screen.dart';
import 'package:nilay/ui/vendors/stores/home_stores_screen.dart';
import 'package:nilay/ui/vendors/stores/product/product_details_screen.dart';
import 'package:nilay/ui/vendors/stores/product/products_category_screen.dart';
import 'package:nilay/ui/vendors/stores/product/products_screen.dart';
import 'package:nilay/ui/vendors/stores/store_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/beauty_centers_experts_screen.dart';
import 'package:nilay/ui/vendors/beauty_centers/album_beauty_center_screen.dart';

class AppRoutes {

  static final routesPages = [
    // TODO BOARDING SCREENS
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.language, page: () => LanguageScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),

    // TODO AUTH SCREENS
    GetPage(name: Routes.signIn, page: () => SignInScreen(), binding: SignInBinging()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen(), binding: SignUpBinging()),
    GetPage(name: Routes.selectEmailPhone, page: () => SelectEmailPhoneScreen(), binding: ForgetPasswordBinging()),
    GetPage(name: Routes.sendCode, page: () => SendCodeScreen()),
    GetPage(name: Routes.verificationCode, page: () => VerificationCodeScreen()),
    GetPage(name: Routes.newPassword, page: () => NewPasswordScreen()),
    GetPage(name: Routes.congratulations, page: () => CongratulationsScreen()),

    // TODO HOME SCREEN WITH ORDERS
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.recentVisited, page: () => RecentVisitedScreen()),
    GetPage(name: Routes.vendors, page: () => VendorsScreen()),
    GetPage(name: Routes.vendorOrders, page: () => VendorOrdersScreen()),

    // TODO PROFILE SCREENS AND GENERAL
    GetPage(name: Routes.addresses, page: () => AddressScreen()),
    GetPage(name: Routes.addAddress, page: () => AddAddressScreen()),
    GetPage(name: Routes.notifications, page: () => NotificationsScreen()),
    GetPage(name: Routes.personalInfo, page: () => PersonalInfoScreen()),


    // TODO VENDORS
    // TODO STORES
    GetPage(name: Routes.homeStores, page: () => HomeStoresScreen()),
    GetPage(name: Routes.allStores, page: () => AllStoresScreen()),
    GetPage(name: Routes.store, page: () => StoreScreen()),
    GetPage(name: Routes.productsCategory, page: () => ProductsCategoryScreen()),
    GetPage(name: Routes.products, page: () => ProductsScreen()),
    GetPage(name: Routes.productDetails, page: () => ProductDetailsScreen()),
    GetPage(name: Routes.cartStores, page: () => const CartStoresScreen()),
    GetPage(name: Routes.cartOrders, page: () => CartOrdersScreen()),

    // TODO BEAUTY CENTER
    GetPage(name: Routes.homeBeautyCenter, page: () => HomeBeautyCenterScreen()),
    GetPage(name: Routes.allBeautyCenters, page: () => AppBeautyCentersScreen()),
    GetPage(name: Routes.beautyCenter, page: () => BeautyCenterScreen()),
    GetPage(name: Routes.allBeautyCenterServices, page: () => BeautyCenterServicesScreen()),
    GetPage(name: Routes.allBeautyCenterExperts, page: () => BeautyCenterExpertsScreen()),
    GetPage(name: Routes.albumBeautyCenter, page: () => AlbumBeautyCenterScreen()),

    // TODO FILTER
    GetPage(name: Routes.filterAllStores, page: () => FilterAllStoresScreen()),
    GetPage(name: Routes.filterAllProducts, page: () => FilterAllProductsScreen()),

    // TODO CHAT
    GetPage(name: Routes.chat, page: () => ChatScreen()),
  ];
}

class Routes {
  static const splash = '/splash';
  static const language = '/language';
  static const boarding = '/boarding';
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const selectEmailPhone = '/select_email_phone';
  static const sendCode = '/send_code';
  static const verificationCode = '/verify_code';
  static const newPassword = '/new_password';
  static const congratulations = '/congratulations';

  static const home = '/home';
  static const recentVisited = '/recent_visited';
  static const vendors = '/vendors';
  static const vendorOrders = '/vendor_orders';

  static const addresses = '/addresses';
  static const addAddress = '/add_address';
  static const notifications = '/notifications';
  static const personalInfo = '/personal_info';

  // TODO STORES
  static const homeStores = '/home_stores';
  static const allStores = '/all_stores';
  static const store = '/store';
  static const productsCategory = '/products_category';
  static const products = '/products';
  static const productDetails = '/product_details';
  static const cartStores = '/cart_stores';
  static const cartOrders = '/cart_orders';

  // TODO BEAUTY CENTER
  static const homeBeautyCenter = '/home_beauty_center';
  static const allBeautyCenters = '/all_beauty_center';
  static const beautyCenter = '/beauty_center';
  static const allBeautyCenterServices = '/all_beauty_center_service';
  static const allBeautyCenterExperts = '/all_beauty_center_experts';
  static const albumBeautyCenter = '/album_beauty_center';

  // TODO FILTERS
  static const filterAllStores = '/filter_all_stores';
  static const filterAllProducts = '/filter_all_products';

  static const map = '/map';
  static const chat = '/chat';

}