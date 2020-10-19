import 'package:booking_details_app/api/configuration/get_booking_details_configuration.dart';
import 'package:booking_details_app/api/datamodal/get_booking_details_api_datamodal.dart';
import 'package:booking_details_app/api/query/get_booking_details_query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../main.dart';

GetBookingDetailsConfiguration graphQLConfiguration = GetBookingDetailsConfiguration();

class BookingDetailsRepoProvider {
  Future<List<Booking>> getBookingDetailsRepos(int currentPage,
      List<Booking> bookList) {
    return graphQLConfiguration
        .getGraphQLClient()
        .query(_queryOptions(currentPage))
        .then((value) {
      return _toBookingDetailsRepo(value, bookList);
    });
  }

  QueryOptions _queryOptions(int currentPage) {
    Map<String, dynamic> map = Map();
  //  print("currentPage - > $currentPage");
    map["currentPage"] = currentPage;
    map["requestType"] = "previous";
    return QueryOptions(
      documentNode: gql(readRepositories),
      variables: map,
    );
  }


  List<Booking> _toBookingDetailsRepo(QueryResult queryResult,
      List<Booking> bookList) {
    if (queryResult.hasException) {
      //print("listdsf: ${_queryOptions().variables}");
  //    print("listdsf: ${queryResult.exception}");
   //   print("${queryResult.hasException}");
      throw Exception();
    }
    if (queryResult.loading) {
      CircularProgressIndicator();
    }

    final list =
    queryResult.data['getBookings']['results']['bookings'] as List<dynamic>;
  //  print("listdsf: $list");
    StreamClass().isLoadingSteramController.add(false);

    final List<Booking> repos = [
      ...bookList,
      ...list.map((repoJson) => Booking.fromJson(repoJson)).toList()
    ];

    //return list.map((repoJson) => Booking.fromJson(repoJson)).toList();
    return repos;
  }

}