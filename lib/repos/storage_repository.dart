import 'dart:io';

import 'package:food_delivery_green/refs/firebase_refs.dart';

class StorageRepositories{
  static Future<String> userImageUrl({required File imageFile,required String userID})async{
    var snapshot=await fireStorage.ref().child('userImage/$userID').putFile(imageFile);
    var downloadUrl=await snapshot.ref.getDownloadURL();
    print(downloadUrl);
    return downloadUrl;
  }
}