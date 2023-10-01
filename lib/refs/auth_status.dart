import 'package:get_storage/get_storage.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

var authBox = GetStorage('authBox');
