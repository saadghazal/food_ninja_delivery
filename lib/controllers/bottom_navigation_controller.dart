import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final screenIndex = 0.obs;
  void selectScreen(int index) {
    screenIndex.value = index;
    print(index);
  }
}
