import 'package:food_delivery_green/controllers/bottom_navigation_controller.dart';
import 'package:food_delivery_green/controllers/image_picker_controller.dart';
import 'package:food_delivery_green/controllers/location_controller.dart';
import 'package:food_delivery_green/controllers/restaurants_controller.dart';
import 'package:food_delivery_green/controllers/visa_controller.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_in_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/done_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/fill_bio_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/payment_method_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_screen.dart';
import 'package:food_delivery_green/screens/chat_screen.dart';
import 'package:food_delivery_green/screens/get_started_screens/first_get_started_screen.dart';
import 'package:food_delivery_green/screens/get_started_screens/second_get_started.dart';
import 'package:food_delivery_green/screens/home_screens/home_screen.dart';
import 'package:food_delivery_green/screens/home_screens/main_screen.dart';
import 'package:food_delivery_green/screens/map_screen.dart';
import 'package:food_delivery_green/screens/order_screens/order_details_screen.dart';
import 'package:food_delivery_green/screens/restScreens/meal_screen.dart';
import 'package:food_delivery_green/screens/restScreens/restaurant_screen.dart';
import 'package:food_delivery_green/services/location_service.dart';
import 'package:get/get.dart';

import '../screens/authentication_screens/sign_up_pages/set_loation_screen.dart';
import '../screens/authentication_screens/sign_up_pages/upload_profile_photo_screen.dart';
import '../screens/get_started_screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: '/',
        page: () => SplashScreen(),
      ),
      GetPage(
        name: FirstGetScreen.routeName,
        page: () => FirstGetScreen(),
      ),
      GetPage(
        name: SecondGetScreen.routeName,
        page: () => SecondGetScreen(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => MainScreen(),
        binding: BindingsBuilder(
          () {
            Get.put(RestaurantsController());
            Get.put(BottomNavigationController(), permanent: true);
          },
        ),
      ),
      GetPage(
        name: SignInScreen.routeName,
        page: () => SignInScreen(),
      ),
      GetPage(
        name: SignUpScreen.routeName,
        page: () => SignUpScreen(),
      ),
      GetPage(
        name: FillBioScreen.routName,
        page: () => FillBioScreen(),
      ),
      GetPage(
          name: PaymentMethodScreen.routName,
          page: () => PaymentMethodScreen(),
          binding: BindingsBuilder(() {
            Get.put(VisaController());
          })),
      GetPage(
        name: UploadProfilePhotoScreen.routName,
        page: () => UploadProfilePhotoScreen(),
        binding: BindingsBuilder(
          () {
            Get.put(ImagePickerController());
          },
        ),
      ),
      GetPage(
        name: SetLocationScreen.routName,
        page: () => SetLocationScreen(),
        binding: BindingsBuilder(
          () {
            Get.put(LocationService());
            Get.put(
              LocationController(
                locationService: Get.find(),
              ),
            );
          },
        ),
      ),
      GetPage(
        name: MapScreen.routName,
        page: () => MapScreen(),
      ),
      GetPage(
        name: RestaurantScreen.routeName,
        page: () => RestaurantScreen(
          restMeals: [],
        ),
      ),
      GetPage(
        name: MealScreen.routeName,
        page: () => MealScreen(
          meal: null,
        ),
      ),
      GetPage(
        name: OrderDetailsScreen.routeName,
        page: () => OrderDetailsScreen(),
      ),
      GetPage(
        name: DoneScreen.routeName,
        page: () => DoneScreen(),
      ),
      GetPage(
        name: ChatScreen.routeName,
        page: () => ChatScreen(),
      ),
    ];
  }
}
