import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final fireStorage=FirebaseStorage.instance;
final restRf = fireStore.collection('restaurants');
final fireAuth = FirebaseAuth.instance;
final fireUserDoc = fireStore.collection('users');
CollectionReference userInfo({required String userID}) =>
    fireUserDoc.doc(userID).collection('user_info');
