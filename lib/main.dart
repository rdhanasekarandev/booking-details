import 'package:booking_details_app/repo/get_booking_details_bloc.dart';
import 'package:booking_details_app/repo/get_booking_details_repo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'routes/booking_details_route.dart';

void main() {
  runApp(MyApp());
}
class StreamClass {
  StreamClass._();

  static StreamClass _streamClass = StreamClass._();

  factory StreamClass() {
    return _streamClass;
  }

  BehaviorSubject<bool> isLoadingSteramController = BehaviorSubject<bool>();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider<GetBookingDetailsRepoBloc>(
        create: (_) =>
            GetBookingDetailsRepoBloc(
              bookingDetailsRepo: BookingDetailsRepoProvider(),
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: BookingDetails(),
      ),
    );
  }
}
