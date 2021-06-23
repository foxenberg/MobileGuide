import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_guid/models/constants.dart';

import 'package:mobile_guid/models/route.dart';


class ShowRouteScreen extends StatefulWidget {
  final List<PlacesForRoute> placesForRoute;

  ShowRouteScreen(this.placesForRoute, {Key? key}) : super(key: key);

  @override
  _ShowRouteScreenState createState() => _ShowRouteScreenState();
}

class _ShowRouteScreenState extends State<ShowRouteScreen> {
  late GoogleMapController mapController;

  final LatLng _center = LatLng(45.521563, -122.677433);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void showMap() {
    showDialog(
      context: context,
      builder: (context) => GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://cutt.ly/xnSihGY"),
                        fit: BoxFit.fill)),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0))),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: ListView.builder(
            itemCount: widget.placesForRoute.length,
            itemBuilder: (BuildContext context, int index) {
              Size size = MediaQuery.of(context).size;
              return FlipCard(
                front: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 2,
                  ),
                  // color: Colors.blueAccent,
                  height: 160,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      // Those are our background
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: kPrimaryColor,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),
                      // our product image
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 140,
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              widget.placesForRoute[index].photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Product title and price
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 136,
                          width: size.width - 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  widget.placesForRoute[index].name,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              // it use the available space
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child:
                                    Text(widget.placesForRoute[index].address),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding * 1.5,
                                  vertical: kDefaultPadding / 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                  ),
                                ),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 36.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                back: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 2,
                  ),
                  height: 160,
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.placesForRoute[index].reviews,
                              style: TextStyle(fontSize: 11.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

class MyClipperForRoute extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
