import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/api/firebase_api.dart';
import 'package:nilay/bindings/app_bindings.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/local.dart';
import 'package:nilay/utils/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseApi().initNotifications();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: AppHelper.getAppLocale(),
        translations: AppTranslations(),
        initialBinding: AppBindings(),
        initialRoute: Routes.splash,
        getPages: AppRoutes.routesPages,
      ),
    );
  }
}
