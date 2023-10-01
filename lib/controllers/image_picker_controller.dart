import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  XFile? pickedImage ;
  String imagePath='';

  Future<void> pickImage(ImageSource imageSource) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: imageSource);

      if (image == null) return;
      image=await cropImage(imageFile: image);
      pickedImage = image!;
      imagePath=pickedImage!.path;
      update(['pic']);
    } on PlatformException catch (e) {
      print(e);
    }
  }
 Future<XFile?> cropImage ({required XFile imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return XFile(croppedImage.path);
  }
  void clearImage() {
    imagePath='';
    pickedImage = null;
    update(['pic']);
  }
}
