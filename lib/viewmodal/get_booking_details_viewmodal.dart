import 'package:flutter/material.dart';

class BookingDetailsRepoModel {
  final String tripStatus;
  final String dateAndTime;
  final double basePrice;
  final String pickUpLocation;
  final String dropOffLocation;
  final String picture;
  final String categoryName;
  final String categoryImage;
  final int paymentType;

  BookingDetailsRepoModel({
    @required this.tripStatus,
    @required this.dateAndTime,
    @required this.basePrice,
    @required this.pickUpLocation,
    @required this.dropOffLocation,
    @required this.picture,
    @required this.categoryName,
    @required this.categoryImage,
    @required this.paymentType,
  });
}