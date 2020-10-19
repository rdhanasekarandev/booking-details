import 'package:booking_details_app/util/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetBookingDetailsConfiguration{
  static HttpLink httpLink = HttpLink(
    uri: endPoint,
    headers: <String, String>{
      'auth': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5MDJjY2MwLTc1ODMtMTFlYS05MmE1LWQ5NmY3M2Q5ZDUwYyIsImVtYWlsIjoiY2hnZ0BmaHZiLnZqbiIsInBob25lTnVtYmVyIjoiNzAxMDUyOTg5MyIsImlhdCI6MTYwMjQ3NjU0NCwiZXhwIjoxNjE4MDI4NTQ0fQ.9BB33JbVeO9WM2UFCVHm2hwUoqqGmU4Sj6bzsygAdC8',
    },
  );

  GraphQLClient _client;

  GraphQLClient getGraphQLClient() {
    _client ??= GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),
    );

    return _client;
  }

}