import 'package:booking_details_app/api/datamodal/get_booking_details_api_datamodal.dart';
import 'package:booking_details_app/repo/get_booking_details_repo_provider.dart';
import 'package:booking_details_app/viewmodal/get_booking_details_viewmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class GetBookingDetailsRepoBloc {
  final bookingDetailsList = BehaviorSubject<List<BookingDetailsRepoModel>>();
  final BookingDetailsRepoProvider bookingDetailsRepo;

  int currentPage = 0;

  List<Booking> bookList = [];

  GetBookingDetailsRepoBloc({
    @required this.bookingDetailsRepo,
  }) {
    getData(false);
  }

  getData(bool status) {
    getRepos(status)
        .then(toViewModel)
        .then(bookingDetailsList.add)
        .catchError((err) => print('Error getting repo ${err.toString()}'));
  }

  Future<List<Booking>> getRepos(bool status) async {
    if(!status) {
      currentPage = currentPage + 1;
    }
    else{
      bookList.clear();
      currentPage=1;
    }
    bookList = await bookingDetailsRepo.getBookingDetailsRepos(currentPage, bookList);
   // print("getRepos() :: ${bookList.length}");
    return bookList;
  }

  List<BookingDetailsRepoModel> toViewModel(List<Booking> dataModelList) {
    return dataModelList
        .map(
          (dataModel) => BookingDetailsRepoModel(
          tripStatus: dataModel.tripStatus,
          dateAndTime: dataModel.driverDetails.vehicleDetails
              .vehicleCategoryDetails.updatedAt,
          basePrice: dataModel.totalFare,
          pickUpLocation: dataModel.pickUpLocation,
          dropOffLocation: dataModel.dropOffLocation,
          picture: dataModel.riderDetails.picture,
          categoryName: dataModel.driverDetails.vehicleDetails
              .vehicleCategoryDetails.categoryName,
          categoryImage: dataModel.driverDetails.vehicleDetails
              .vehicleCategoryDetails.categoryImage,
          paymentType: dataModel.paymentType),
    )
        .toList();
  }

  void dispose() {
    bookingDetailsList.close();
  }
}
