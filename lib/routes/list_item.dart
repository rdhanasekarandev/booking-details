import 'package:booking_details_app/util/constants.dart';
import 'package:booking_details_app/viewmodal/get_booking_details_viewmodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';


Widget listItem(BookingDetailsRepoModel bookingDetails, int index) {
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(
      int.parse(bookingDetails.dateAndTime));
  String dateTime = DateFormat("yyyy-MM-dd kk:mm").format(date);
  print("date and time=>$dateTime");
  print("booking details tripstatus => $index ${bookingDetails.tripStatus}");
  return Card(
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          new Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    bookingDetails.tripStatus=="cancelledByRider"||bookingDetails.tripStatus=="cancelledByDriver"?bookingDetails.tripStatus=="cancelledByRider"?"Cancelled by rider":"Cancelled by driver":"${bookingDetails.tripStatus[0].toUpperCase()}${bookingDetails.tripStatus.substring(1).toLowerCase()}",
                    style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: 10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text("\$"+bookingDetails.basePrice.toString(),style:TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10
                  )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: new Row(
                      children: [
                        Expanded(child: Container()),
                        Image.asset("assets/images/time.png",height: 15,color: Colors.grey,),
                        Container(
                            padding: EdgeInsets.only(left: 3),
                            child: poppinsText(text: dateTime,fontSize: 12),
                        ),
                        Expanded(child: Container())
                      ]
                  )
                  ,
                ),
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         color: bookingDetails.tripStatus=="cancelledByRider"||bookingDetails.tripStatus=="cancelledByDriver"?Color(0xffff0000):Color(0xff00b601),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       child: Text(
          //         bookingDetails.tripStatus=="cancelledByRider"||bookingDetails.tripStatus=="cancelledByDriver"?bookingDetails.tripStatus=="cancelledByRider"?"Cancelled by rider":"Cancelled by driver":"${bookingDetails.tripStatus[0].toUpperCase()}${bookingDetails.tripStatus.substring(1).toLowerCase()}",
          //         style: TextStyle(color: Colors.white,fontFamily: "Poppins"),
          //       ),
          //     ),
          //     Row(
          //
          //       children: [
          //         Icon(
          //           Icons.access_time,
          //           color: Colors.grey,
          //           size: 18,
          //         ),
          //         SizedBox(
          //           width: 5,
          //         ),
          //         poppinsText(text: dateTime,fontSize: 15),
          //       ],
          //     ),
          //     RichText(
          //       text: TextSpan(
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //         ),
          //         children: [
          //           TextSpan(
          //             text: "\$",
          //           ),
          //           TextSpan(
          //             text: bookingDetails.basePrice.toString(),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("asset/images/pickup_drop.png",width:20,height:60),
                /* Column(
                  children: [
                    Icon(Icons.my_location),
                    Divider(
                      height: 45,
                    ),
                    Icon(Icons.location_on),
                  ],
                ),*/
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 8.0,bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bookingDetails.pickUpLocation,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          height: 30,
                        ),
                        Text(
                          bookingDetails.dropOffLocation,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bookingDetails.picture == null
                    ? Icon(
                  Icons.account_circle,
                  color: Colors.grey[300],
                  size: 60,
                )
                    : Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(
                          '$profileImageUri${bookingDetails.picture}'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(40.0)),
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    "$categoryImageUri${bookingDetails.categoryImage}",
                    width: 40,
                    height: 28,
                  ),
                  poppinsText(text: bookingDetails.categoryName,fontSize: 11)
                ],
              ),
              Row(
                children: [
                  paymentType(
                      bookingDetails.categoryImage, bookingDetails.paymentType),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget paymentType(String categoryImage, int paymentType) {
  if (paymentType == 1) {
    return payment(icon: Icons.monetization_on, text: "Cash");
  } else if (paymentType == 2) {
    return payment(icon: Icons.call_to_action, text: "Card");
  } else {
    return payment(icon: Icons.account_balance_wallet, text: "Wallet");
  }
}

Widget payment({IconData icon, String text}) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      SizedBox(
        width: 5,
      ),
      poppinsText(text: text,fontSize: 11),
    ],
  );
}

Text poppinsText(
    {String text,
      double fontSize,
      Color color = Colors.grey,
      FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
  );
}
