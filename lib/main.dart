import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/app_routes/app_routes.dart';
import 'package:food_delivery_green/bindings/init.dart';
import 'package:food_delivery_green/firebase_options.dart';
import 'package:food_delivery_green/themes/light_theme.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
      statusBarBrightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
    ),
  );

  InitBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ( context, _) {
        return GetMaterialApp(
          theme: LightTheme.buildLightTheme(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          getPages: AppRoutes.appRoutes(),
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
