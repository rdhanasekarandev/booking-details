import 'dart:async';
import 'package:booking_details_app/repo/get_booking_details_bloc.dart';
import 'package:booking_details_app/viewmodal/get_booking_details_viewmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import 'list_item.dart';

class BookingDetails extends StatefulWidget {
  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  ScrollController _scrollController = new ScrollController();
  GetBookingDetailsRepoBloc bookingDetailsRepoBloc;
  bool isPerformingRequest = false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<BookingDetailsRepoModel> repositories;

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
   // print("repositories == > ${repositories.length}");
    setState(() {
      repositories.clear();
    });
   // print("repositories == > ${repositories.length}");
    bookingDetailsRepoBloc.bookingDetailsList.value.clear();
    await bookingDetailsRepoBloc.getData(true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //print("repositories = > ${repositories.length}");

    _refreshController.loadComplete();
  }


  @override
  void initState() {
    super.initState();

    StreamClass().isLoadingSteramController.add(false);
    _scrollController
      ..addListener(() async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {

          StreamClass().isLoadingSteramController.add(true);
          if (bookingDetailsRepoBloc != null) {
            _getMoreData();
            await bookingDetailsRepoBloc.getData(false);
          }
        }
        if (_scrollController.position.pixels ==
            _scrollController.position.minScrollExtent) {
          print("minScrollExtent");
        }
      });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      StreamClass().isLoadingSteramController.add(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    bookingDetailsRepoBloc = Provider.of<GetBookingDetailsRepoBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: commonTabTileText(
                  text: 'Trips', color: Colors.white, fontSize: 18),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Container(
                  height: 50,
                  child: Center(
                    child: commonTabTileText(
                        text: "CURRENT", color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: commonTabTileText(
                        text: "PAST", color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(),
              StreamBuilder(
                  stream: bookingDetailsRepoBloc.bookingDetailsList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return new Text("Error");
                    } else if (snapshot.hasData == null) {
                      return Container(
                        child: Center(child: Text("No Data Found")),
                      );
                    } else if (snapshot.hasData) {
                      repositories =
                      snapshot.data as List<BookingDetailsRepoModel>;
                      return SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        header: WaterDropHeader(
                          waterDropColor: Colors.black,
                        ),
                        footer: CustomFooter(
                          builder: (BuildContext context,LoadStatus mode){
                            Widget body ;
                            if(mode==LoadStatus.idle){
                              body =  Text("pull up load");
                            }
                            else if(mode==LoadStatus.loading){
                              repositories.clear();
                              body =  CupertinoActivityIndicator();
                            }
                            else if(mode == LoadStatus.failed){
                              body = Text("Load Failed!Click retry!");
                            }
                            else if(mode == LoadStatus.canLoading){
                              body = Text("release to load more");
                            }
                            else{
                              body = Text("No more Data");
                            }
                            return Container(
                              height: 55.0,
                              child: Center(child:body),
                            );
                          },
                        ),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: repositories.length+1,
                          itemBuilder: (BuildContext context, index) {
                            return index == repositories.length ?_buildProgressIndicator():listItem(repositories[index], index);
                          },
                        ),
                      );
                    } else
                      return Container();
                  }),
            ],
          )),
    );
  }

  Text commonTabTileText({String text, Color color, double fontSize}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
    );
  }

  Widget _buildProgressIndicator() {
    return new Center(
      child: new Opacity(
        opacity: StreamClass().isLoadingSteramController.value ? 0.0 : 1.0,
        child: new JumpingDotsProgressIndicator(fontSize: 40.0,),
      ),
    );
  }
}
