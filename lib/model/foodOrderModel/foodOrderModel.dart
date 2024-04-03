// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quicknomsdriver/model/FoodModel/FoodModel.dart';
import 'package:quicknomsdriver/model/driverModel/driverModel.dart';
import 'package:quicknomsdriver/model/restaurantModel.dart';
import 'package:quicknomsdriver/model/userAddressModel.dart';
import 'package:quicknomsdriver/model/userModel.dart';

class FoodOrderModel {
  FoodModel foodDetails;
  RestaurantModel restaurantDetails;
  UserAddressModel? userAddress;
  UserModel? userData;
  DeliveryPartnerModel? deliveryPartnerData;
  String? orderID;
  String restaurantUID;
  String userUID;
  int deliveryCharges;
  String? deliveryGuyUID;
  String? orderStatus;
  DateTime? addedTocartAt;
  DateTime? orderPlacedAt;
  DateTime? orderDeliveredAt;

  FoodOrderModel({
    required this.foodDetails,
    required this.restaurantDetails,
    required this.userAddress,
    required this.userData,
    this.deliveryPartnerData,
    required this.orderID,
    required this.restaurantUID,
    required this.userUID,
    required this.deliveryCharges,
    this.deliveryGuyUID,
    required this.orderStatus,
    this.addedTocartAt,
    required this.orderPlacedAt,
    this.orderDeliveredAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodDetails': foodDetails.toMap(),
      'restaurantDetails': restaurantDetails.toMap(),
      'userAddress': userAddress?.toMap(),
      'userData': userData?.toMap(),
      'deliveryPartnerData': deliveryPartnerData?.toMap(),
      'orderID': orderID,
      'restaurantUID': restaurantUID,
      'userUID': userUID,
      'deliveryCharges': deliveryCharges,
      'deliveryGuyUID': deliveryGuyUID,
      'orderStatus': orderStatus,
      'addedTocartAt': addedTocartAt?.millisecondsSinceEpoch,
      'orderPlacedAt': orderPlacedAt?.millisecondsSinceEpoch,
      'orderDeliveredAt': orderDeliveredAt?.millisecondsSinceEpoch,
    };
  }

  factory FoodOrderModel.fromMap(Map<String, dynamic> map) {
    return FoodOrderModel(
      foodDetails:
          FoodModel.fromMap(map['foodDetails'] as Map<String, dynamic>),
      restaurantDetails: RestaurantModel.fromMap(
          map['restaurantDetails'] as Map<String, dynamic>),
      userAddress: map['userAddress'] != null
          ? UserAddressModel.fromMap(map['userAddress'] as Map<String, dynamic>)
          : null,
      userData: map['userData'] != null
          ? UserModel.fromMap(map['userData'] as Map<String, dynamic>)
          : null,
      deliveryPartnerData: map['deliveryPartnerData'] != null
          ? DeliveryPartnerModel.fromMap(
              map['deliveryPartnerData'] as Map<String, dynamic>)
          : null,
      orderID: map['orderID'] != null ? map['orderID'] as String : null,
      restaurantUID: map['restaurantUID'] as String,
      userUID: map['userUID'] as String,
      deliveryCharges: map['deliveryCharges'] as int,
      deliveryGuyUID: map['deliveryGuyUID'] != null
          ? map['deliveryGuyUID'] as String
          : null,
      orderStatus:
          map['orderStatus'] != null ? map['orderStatus'] as String : null,
      addedTocartAt: map['addedTocartAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['addedTocartAt'] as int)
          : null,
      orderPlacedAt: map['orderPlacedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['orderPlacedAt'] as int)
          : null,
      orderDeliveredAt: map['orderDeliveredAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['orderDeliveredAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodOrderModel.fromJson(String source) =>
      FoodOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
