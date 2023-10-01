import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_green/models/payment_card.dart';

class UserModel extends Equatable {
  String? username;
  String? email;
  String? password;
  String? userPhoto;
  String? firstName;
  String? lastName;
  String? userLocation;
  PaymentCard? userPaymentCard;
  String? userPhoneNumber;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.userPhoto,
    this.firstName,
    this.lastName,
    this.userLocation,
    this.userPaymentCard,
    this.userPhoneNumber,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> user) {
    return UserModel(
      username: user['username'] as String,
      email: user['email'] as String,
      userPhoto: user['userPhoto'] as String,
      firstName: user['firstName'] as String,
      lastName: user['lastName'] as String,
      userLocation: user['userLocation'],
      userPaymentCard:
          PaymentCard.fromJson(user['userPaymentCard'] as Map<String, dynamic>),
      userPhoneNumber: user['phone_number'],
    );
  }

  factory UserModel.fromSnapshot2(DocumentSnapshot<Map<String, dynamic>> user) {
    return UserModel(
      username: user['username'] as String,
      email: user['email'] as String,
      password: user['password'] as String,
    );
  }

  factory UserModel.fromGoogle(DocumentSnapshot<Map<String, dynamic>> user) {
    print(user.id);
    return UserModel(
      username: user['displayName'],
      email: '',
      userPhoto: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'userPhoto': userPhoto,
      'firstName': firstName,
      'lastName': lastName,
      'userLocation': userLocation,
      'userPaymentCard': userPaymentCard?.toJson(),
      'phone_number': userPhoneNumber,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      userPhoto: json['userPhoto'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userLocation: json['userLocation'],
      userPaymentCard: PaymentCard.fromJson({}),
    );
  }

  @override
  String toString() {
    return 'UserModel{username: $username, email: $email, password: $password, userPhoto: $userPhoto, firstName: $firstName, lastName: $lastName, userLocation: $userLocation, userPaymentCard: $userPaymentCard, userPhoneNumber: $userPhoneNumber}';
  }

  @override
  List<Object> get props => [];
}
