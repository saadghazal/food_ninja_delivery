import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_green/models/payment_card.dart';
import 'package:food_delivery_green/models/user_model.dart';
import 'package:food_delivery_green/refs/firebase_refs.dart';
import 'package:food_delivery_green/repos/auth_repository.dart';
import 'package:food_delivery_green/repos/storage_repository.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_in_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/fill_bio_screen.dart';
import 'package:food_delivery_green/screens/home_screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/get_started_screens/first_get_started_screen.dart';

class AuthController extends GetxController {
  SharedPreferences sharedPreferences;
  UserModel signedUser = UserModel();
  final AuthRepository authRepository;
  Rx<bool> isLoading = false.obs;

  @override
  void onReady() {
    initAuth();

    super.onReady();
  }

  void storeAuthState(String status) {
    sharedPreferences.setString('status', status);
  }

  String? storedAuthStatus() {
    return sharedPreferences.getString('status');
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final authStatus = storedAuthStatus();
    if (authStatus == null) {
      Get.offAllNamed(FirstGetScreen.routeName);
    } else {
      if (authStatus == 'unauthenticated') {
        Get.offAllNamed(SignInScreen.routeName);
      } else {
        final user = fireAuth.currentUser;
        print(user?.providerData[0].providerId);
        if (user?.providerData[0].providerId == 'google.com') {
          signedUser = UserModel.fromGoogle(
              await fireUserDoc.doc(user?.providerData[0].uid).get());
          Get.offAllNamed(HomeScreen.routeName);
        } else {
          getUserData();
          Get.offAllNamed(HomeScreen.routeName);
        }
      }
    }
  }

  Future<void> getUserData() async {
    final userData=await fireUserDoc.doc(fireAuth.currentUser!.uid).get();
    signedUser=UserModel.fromSnapshot(userData);
  }

  Future<void> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        var authentication = await account.authentication;
        var userCredential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        await fireAuth.signInWithCredential(userCredential);
        saveUserData(account);
        signedUser =
            UserModel.fromGoogle(await fireUserDoc.doc(account.id).get());
        Get.offAllNamed(HomeScreen.routeName);
        storeAuthState('authenticated');
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  saveUserData(GoogleSignInAccount account) {
    fireStore.collection('users').doc(account.id).set(
      {
        // 'email': account.email,
        'displayName': account.displayName,
        // 'userPic': account.photoUrl,
      },
    );
  }

  Future<void> signUp({
    String username = '',
    String email = '',
    String password = '',
  }) async {
    isLoading.value = true;
    await authRepository.signUp(
      email: email,
      password: password,
    );
    signedUser.email = email;
    signedUser.password = password;
    signedUser.username = username;
    // await getUser();
    Get.to(
      () => FillBioScreen(),
      transition: Transition.fade,
    );
    isLoading.value = false;
  }

  Future<void> signIn({
    String email = '',
    String password = '',
  }) async {
    isLoading.value = true;
    await authRepository.signIn(email: email, password: password);
    await getUserData();
    storeAuthState('authenticated');

    Get.offAllNamed(HomeScreen.routeName);
    isLoading.value = false;
  }

  signOut() async {
    await fireAuth.signOut();
    Get.offAllNamed(SignInScreen.routeName);
    storeAuthState('unauthenticated');
  }

  AuthController({
    required this.sharedPreferences,
    required this.authRepository,
  });
  

  //sign up details
  void saveUserNameAndPhoneNumber(
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    signedUser.firstName = firstName;
    signedUser.lastName = lastName;
    signedUser.userPhoneNumber = phoneNumber;
  }

  void saveUserVisaInfo({
    required String cardNumber,
    required String cardHolderName,
    required String cardExpiryDate,
    required String cardCVV,
  }) async {
    signedUser.userPaymentCard = PaymentCard.getVisaData(
      visaNumber: cardNumber,
      visaCvv: cardCVV,
      visaExpiry: cardExpiryDate,
      visaHolderName: cardHolderName,
    );
    print('visa_data${signedUser.userPaymentCard}');
  }

  void saveImageInfo({required File userImage}) async {
    var imageUrl = await StorageRepositories.userImageUrl(
      imageFile: userImage,
      userID: fireAuth.currentUser!.uid,
    );
    signedUser.userPhoto = imageUrl;
    print('image_uploaded');
  }

  void saveUserLocation({required String userLocation}) async {
    signedUser.userLocation = userLocation;

    print(signedUser);
    // isLoading.value = false;

  }
  Future<void> sendUserData()async{
    isLoading.value=true;
    await fireStore.collection('users').doc(fireAuth.currentUser!.uid).set(signedUser.toJson());
    isLoading.value=false;
    storeAuthState('authenticated');
  }
}
