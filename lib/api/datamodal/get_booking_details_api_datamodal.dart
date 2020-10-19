import 'dart:convert';

BookingDetails bookingDetailsFromJson(String str) =>
    BookingDetails.fromJson(json.decode(str));

String bookingDetailsToJson(BookingDetails data) => json.encode(data.toJson());

class BookingDetails {
  BookingDetails({
    this.data,
  });

  Data data;

  factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.getBookings,
  });

  GetBookings getBookings;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getBookings: json["getBookings"] == null
        ? null
        : GetBookings.fromJson(json["getBookings"]),
  );

  Map<String, dynamic> toJson() => {
    "getBookings": getBookings == null ? null : getBookings.toJson(),
  };
}

class GetBookings {
  GetBookings({
    this.results,
    this.status,
    this.errorMessage,
  });

  Results results;
  int status;
  String errorMessage;

  factory GetBookings.fromJson(Map<String, dynamic> json) => GetBookings(
    results:
    json["results"] == null ? null : Results.fromJson(json["results"]),
    status: json["status"] == null ? null : json["status"],
    errorMessage:
    json["errorMessage"] == null ? null : json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? null : results.toJson(),
    "status": status == null ? null : status,
    "errorMessage": errorMessage == null ? null : errorMessage,
  };
}

class Results {
  Results({
    this.bookings,
    this.count,
  });

  List<Booking> bookings;
  int count;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    bookings: json["bookings"] == null
        ? null
        : List<Booking>.from(
        json["bookings"].map((x) => Booking.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "bookings": bookings == null
        ? null
        : List<dynamic>.from(bookings.map((x) => x.toJson())),
    "count": count == null ? null : count,
  };
}

class Booking {
  Booking({
    this.id,
    this.riderLocation,
    this.riderLocationLat,
    this.riderLocationLng,
    this.isSpecialTrip,
    this.specialTripPrice,
    this.specialTripTotalFare,
    this.isTipGiven,
    this.tipsAmount,
    this.tipsTotalFare,
    this.tipsDriverTotalFare,
    this.pickUpLocation,
    this.pickUpLat,
    this.pickUpLng,
    this.dropOffLocation,
    this.dropOffLat,
    this.dropOffLng,
    this.riderId,
    this.driverId,
    this.tripStatus,
    this.vehicleType,
    this.totalRideDistance,
    this.baseFare,
    this.baseUnit,
    this.riderServiceFee,
    this.riderTotalFare,
    this.driverTotalFare,
    this.driverServiceFee,
    this.estimatedTotalFare,
    this.totalFare,
    this.totalDuration,
    this.paymentType,
    this.paymentStatus,
    this.transactionId,
    this.startDate,
    this.currency,
    this.startTime,
    this.endDate,
    this.endTime,
    this.tripStart,
    this.tripEnd,
    this.riderDetails,
    this.driverDetails,
  });

  int id;
  String riderLocation;
  double riderLocationLat;
  double riderLocationLng;
  bool isSpecialTrip;
  int specialTripPrice;
  int specialTripTotalFare;
  bool isTipGiven;
  int tipsAmount;
  int tipsTotalFare;
  int tipsDriverTotalFare;
  String pickUpLocation;
  double pickUpLat;
  double pickUpLng;
  String dropOffLocation;
  double dropOffLat;
  double dropOffLng;
  String riderId;
  String driverId;
  String tripStatus;
  String vehicleType;
  double totalRideDistance;
  int baseFare;
  int baseUnit;
  double riderServiceFee;
  double riderTotalFare;
  double driverTotalFare;
  double driverServiceFee;
  double estimatedTotalFare;
  double totalFare;
  double totalDuration;
  int paymentType;
  String paymentStatus;
  String transactionId;
  DateTime startDate;
  String currency;
  String startTime;
  DateTime endDate;
  String endTime;
  String tripStart;
  String tripEnd;
  RiderDetails riderDetails;
  DriverDetails driverDetails;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"] == null ? null : json["id"],
    riderLocation:
    json["riderLocation"] == null ? null : json["riderLocation"],
    riderLocationLat: json["riderLocationLat"] == null
        ? null
        : json["riderLocationLat"].toDouble(),
    riderLocationLng: json["riderLocationLng"] == null
        ? null
        : json["riderLocationLng"].toDouble(),
    isSpecialTrip:
    json["isSpecialTrip"] == null ? null : json["isSpecialTrip"],
    specialTripPrice:
    json["specialTripPrice"] == null ? null : json["specialTripPrice"],
    specialTripTotalFare: json["specialTripTotalFare"] == null
        ? null
        : json["specialTripTotalFare"],
    isTipGiven: json["isTipGiven"] == null ? null : json["isTipGiven"],
    tipsAmount: json["tipsAmount"] == null ? null : json["tipsAmount"],
    tipsTotalFare:
    json["tipsTotalFare"] == null ? null : json["tipsTotalFare"],
    tipsDriverTotalFare: json["tipsDriverTotalFare"] == null
        ? null
        : json["tipsDriverTotalFare"],
    pickUpLocation:
    json["pickUpLocation"] == null ? null : json["pickUpLocation"],
    pickUpLat:
    json["pickUpLat"] == null ? null : json["pickUpLat"].toDouble(),
    pickUpLng:
    json["pickUpLng"] == null ? null : json["pickUpLng"].toDouble(),
    dropOffLocation:
    json["dropOffLocation"] == null ? null : json["dropOffLocation"],
    dropOffLat:
    json["dropOffLat"] == null ? null : json["dropOffLat"].toDouble(),
    dropOffLng:
    json["dropOffLng"] == null ? null : json["dropOffLng"].toDouble(),
    riderId: json["riderId"] == null ? null : json["riderId"],
    driverId: json["driverId"] == null ? null : json["driverId"],
    tripStatus: json["tripStatus"] == null ? null : json["tripStatus"],
    vehicleType: json["vehicleType"] == null ? null : json["vehicleType"],
    totalRideDistance: json["totalRideDistance"] == null
        ? null
        : json["totalRideDistance"].toDouble(),
    baseFare: json["baseFare"] == null ? null : json["baseFare"],
    baseUnit: json["baseUnit"] == null ? null : json["baseUnit"],
    riderServiceFee: json["riderServiceFee"] == null
        ? null
        : json["riderServiceFee"].toDouble(),
    riderTotalFare: json["riderTotalFare"] == null
        ? null
        : json["riderTotalFare"].toDouble(),
    driverTotalFare: json["driverTotalFare"] == null
        ? null
        : json["driverTotalFare"].toDouble(),
    driverServiceFee: json["driverServiceFee"] == null
        ? null
        : json["driverServiceFee"].toDouble(),
    estimatedTotalFare: json["estimatedTotalFare"] == null
        ? null
        : json["estimatedTotalFare"].toDouble(),
    totalFare:
    json["totalFare"] == null ? null : json["totalFare"].toDouble(),
    totalDuration: json["totalDuration"] == null
        ? null
        : json["totalDuration"].toDouble(),
    paymentType: json["paymentType"] == null ? null : json["paymentType"],
    paymentStatus:
    json["paymentStatus"] == null ? null : json["paymentStatus"],
    transactionId:
    json["transactionId"] == null ? null : json["transactionId"],
    startDate: json["startDate"] == null
        ? null
        : DateTime.parse(json["startDate"]),
    currency: json["currency"] == null ? null : json["currency"],
    startTime: json["startTime"] == null ? null : json["startTime"],
    endDate:
    json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    endTime: json["endTime"] == null ? null : json["endTime"],
    tripStart: json["tripStart"] == null ? null : json["tripStart"],
    tripEnd: json["tripEnd"] == null ? null : json["tripEnd"],
    riderDetails: json["riderDetails"] == null
        ? null
        : RiderDetails.fromJson(json["riderDetails"]),
    driverDetails: json["driverDetails"] == null
        ? null
        : DriverDetails.fromJson(json["driverDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "riderLocation": riderLocation == null ? null : riderLocation,
    "riderLocationLat": riderLocationLat == null ? null : riderLocationLat,
    "riderLocationLng": riderLocationLng == null ? null : riderLocationLng,
    "isSpecialTrip": isSpecialTrip == null ? null : isSpecialTrip,
    "specialTripPrice": specialTripPrice == null ? null : specialTripPrice,
    "specialTripTotalFare":
    specialTripTotalFare == null ? null : specialTripTotalFare,
    "isTipGiven": isTipGiven == null ? null : isTipGiven,
    "tipsAmount": tipsAmount == null ? null : tipsAmount,
    "tipsTotalFare": tipsTotalFare == null ? null : tipsTotalFare,
    "tipsDriverTotalFare":
    tipsDriverTotalFare == null ? null : tipsDriverTotalFare,
    "pickUpLocation": pickUpLocation == null ? null : pickUpLocation,
    "pickUpLat": pickUpLat == null ? null : pickUpLat,
    "pickUpLng": pickUpLng == null ? null : pickUpLng,
    "dropOffLocation": dropOffLocation == null ? null : dropOffLocation,
    "dropOffLat": dropOffLat == null ? null : dropOffLat,
    "dropOffLng": dropOffLng == null ? null : dropOffLng,
    "riderId": riderId == null ? null : riderId,
    "driverId": driverId == null ? null : driverId,
    "tripStatus": tripStatus == null ? null : tripStatus,
    "vehicleType": vehicleType == null ? null : vehicleType,
    "totalRideDistance":
    totalRideDistance == null ? null : totalRideDistance,
    "baseFare": baseFare == null ? null : baseFare,
    "baseUnit": baseUnit == null ? null : baseUnit,
    "riderServiceFee": riderServiceFee == null ? null : riderServiceFee,
    "riderTotalFare": riderTotalFare == null ? null : riderTotalFare,
    "driverTotalFare": driverTotalFare == null ? null : driverTotalFare,
    "driverServiceFee": driverServiceFee == null ? null : driverServiceFee,
    "estimatedTotalFare":
    estimatedTotalFare == null ? null : estimatedTotalFare,
    "totalFare": totalFare == null ? null : totalFare,
    "totalDuration": totalDuration == null ? null : totalDuration,
    "paymentType": paymentType == null ? null : paymentType,
    "paymentStatus": paymentStatus == null ? null : paymentStatus,
    "transactionId": transactionId == null ? null : transactionId,
    "startDate": startDate == null
        ? null
        : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "currency": currency == null ? null : currency,
    "startTime": startTime == null ? null : startTime,
    "endDate": endDate == null
        ? null
        : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "endTime": endTime == null ? null : endTime,
    "tripStart": tripStart == null ? null : tripStart,
    "tripEnd": tripEnd == null ? null : tripEnd,
    "riderDetails": riderDetails == null ? null : riderDetails.toJson(),
    "driverDetails": driverDetails == null ? null : driverDetails.toJson(),
  };
}

class DriverDetails {
  DriverDetails({
    this.userId,
    this.userData,
    this.firstName,
    this.lastName,
    this.picture,
    this.location,
    this.vehicleDetails,
  });

  String userId;
  UserData userData;
  String firstName;
  String lastName;
  String picture;
  String location;
  VehicleDetails vehicleDetails;

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
    userId: json["userId"] == null ? null : json["userId"],
    userData: json["userData"] == null
        ? null
        : UserData.fromJson(json["userData"]),
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    picture: json["picture"] == null ? null : json["picture"],
    location: json["location"] == null ? null : json["location"],
    vehicleDetails: json["vehicleDetails"] == null
        ? null
        : VehicleDetails.fromJson(json["vehicleDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "userData": userData == null ? null : userData.toJson(),
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "picture": picture == null ? null : picture,
    "location": location == null ? null : location,
    "vehicleDetails":
    vehicleDetails == null ? null : vehicleDetails.toJson(),
  };
}

class UserData {
  UserData({
    this.lat,
    this.lng,
    this.overallRating,
    this.phoneNumber,
  });

  double lat;
  double lng;
  double overallRating;
  String phoneNumber;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lng: json["lng"] == null ? null : json["lng"].toDouble(),
    overallRating: json["overallRating"] == null
        ? null
        : json["overallRating"].toDouble(),
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "overallRating": overallRating == null ? null : overallRating,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
  };
}

class VehicleDetails {
  VehicleDetails({
    this.id,
    this.vehicleName,
    this.vehicleCategoryDetails,
  });

  int id;
  String vehicleName;
  VehicleCategoryDetails vehicleCategoryDetails;

  factory VehicleDetails.fromJson(Map<String, dynamic> json) => VehicleDetails(
    id: json["id"] == null ? null : json["id"],
    vehicleName: json["vehicleName"] == null ? null : json["vehicleName"],
    vehicleCategoryDetails: json["vehicleCategoryDetails"] == null
        ? null
        : VehicleCategoryDetails.fromJson(json["vehicleCategoryDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "vehicleName": vehicleName == null ? null : vehicleName,
    "vehicleCategoryDetails": vehicleCategoryDetails == null
        ? null
        : vehicleCategoryDetails.toJson(),
  };
}

class VehicleCategoryDetails {
  VehicleCategoryDetails({
    this.id,
    this.categoryName,
    this.categoryImage,
    this.categoryMarkerImage,
    this.unitPrice,
    this.basePrice,
    this.isActive,
    this.currency,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String categoryName;
  String categoryImage;
  String categoryMarkerImage;
  int unitPrice;
  int basePrice;
  bool isActive;
  String currency;
  String createdAt;
  String updatedAt;

  factory VehicleCategoryDetails.fromJson(Map<String, dynamic> json) =>
      VehicleCategoryDetails(
        id: json["id"] == null ? null : json["id"],
        categoryName:
        json["categoryName"] == null ? null : json["categoryName"],
        categoryImage:
        json["categoryImage"] == null ? null : json["categoryImage"],
        categoryMarkerImage: json["categoryMarkerImage"] == null
            ? null
            : json["categoryMarkerImage"],
        unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
        basePrice: json["basePrice"] == null ? null : json["basePrice"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        currency: json["currency"] == null ? null : json["currency"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "categoryName": categoryName == null ? null : categoryName,
    "categoryImage": categoryImage == null ? null : categoryImage,
    "categoryMarkerImage":
    categoryMarkerImage == null ? null : categoryMarkerImage,
    "unitPrice": unitPrice == null ? null : unitPrice,
    "basePrice": basePrice == null ? null : basePrice,
    "isActive": isActive == null ? null : isActive,
    "currency": currency == null ? null : currency,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}

class RiderDetails {
  RiderDetails({
    this.userId,
    this.userData,
    this.firstName,
    this.lastName,
    this.picture,
    this.location,
  });

  String userId;
  UserData userData;
  String firstName;
  String lastName;
  String picture;
  String location;

  factory RiderDetails.fromJson(Map<String, dynamic> json) => RiderDetails(
    userId: json["userId"] == null ? null : json["userId"],
    userData: json["userData"] == null
        ? null
        : UserData.fromJson(json["userData"]),
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    picture: json["picture"] == null ? null : json["picture"],
    location: json["location"] == null ? null : json["location"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "userData": userData == null ? null : userData.toJson(),
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "picture": picture == null ? null : picture,
    "location": location == null ? null : location,
  };
}
