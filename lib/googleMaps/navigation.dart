import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_mao/constants.dart';
// import 'lib/googleMaps/cons';
// import 'udaan-app-client/lib/googleMaps/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:sr]]';
import 'package:mapbox_turn_by_turn/googleMaps/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class OrderTrackingPage extends StatefulWidget {
  // print('fffff');
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();

}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(12.9916, 80.2337);

  ///// TODO TO BE TAKEN FROM THE NOTIFICATION DATA 
  
  static const LatLng destination = LatLng(12.9891, 80.2235);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
// print("lllllll");
  // void getCurrentLocation() async {
  //   Location location = Location();

  //   location.getLocation().then(
  //     (location) {
  //       currentLocation = location;
  //     },
  //   );

  //   GoogleMapController googleMapController = await _controller.future;

  //   location.onLocationChanged.listen(
  //     (newLoc) {
  //       currentLocation = newLoc;

  //       googleMapController.animateCamera(
  //         CameraUpdate.newCameraPosition(
  //           CameraPosition(
  //             zoom: 13.5,
  //             target: LatLng(
  //               newLoc.latitude!,
  //               newLoc.longitude!,
  //             ),
  //           ),
  //         ),
  //       );

  //       setState(() {});
  //     },
  //   );
  // }

  //////////////////////////////////////////////////////////
  Location location = Location();
  late IO.Socket socket;
  var _isConnected = false;
  late LocationData _locationData;

  void _connect() async {
    socket = IO.io(
        "https://7114-103-158-43-46.ngrok-free.app",
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    socket.connect();

    print(socket.connected);

    socket.onConnect((_) {
      print("connect");
      _isConnected = true;
    });
    socket.onConnectError((data) {
      print("Connection Error ${data}");
    });
  }

  void disconnect() {
    if (_isConnected) {
      socket.disconnect();
      socket.onDisconnect((data) {
        _isConnected = false;
        print("Disconnected");
      });
    }
  }

  void _showLocation() async {
    _locationData = await location.getLocation();
    var msg = {
      "fromId": "1",
      "toId": "2",
      "cordinates": {
        "lat": "${_locationData.latitude}",
        "long": "${_locationData.longitude}"
      }
    };
    socket.emit('sos', jsonEncode(msg.toString()));
  }
////////////////////////////////////////////////////////

  void getCurrentLocation() async {
    // print("lauda bc");
    Location location = Location();

    try {
      LocationData locData = await location.getLocation();
      setState(() {
        currentLocation = locData;
      });

      GoogleMapController googleMapController = await _controller.future;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(
              locData.latitude!,
              locData.longitude!,
            ),
          ),
        ),
      );

      location.onLocationChanged.listen(
        (LocationData newLoc) {
          setState(() {
            currentLocation = newLoc;
          });
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 13.5,
                target: LatLng(
                  newLoc.latitude!,
                  newLoc.longitude!,
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setCustomMarekerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/image/Pin_source.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/image/Pin_destination.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/image/Badge.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  @override
  void initState() {
    print('bhadwa dikshant');
    getCurrentLocation();
    setCustomMarekerIcon();
    getPolyPoints();
    super.initState();
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      print('bbbbbbbbbbbbcccccccccccccccccccccccccccccc');
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Track Help",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: currentLocation == null
            ? const Center(child: Text("Location"))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 13.5,
                ),
                polylines: {
                  Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: primaryColor,
                    width: 6,
                  ),
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    icon: currentLocationIcon,
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                  ),
                  Marker(
                    markerId: MarkerId("source"),
                    icon: sourceIcon,
                    position: sourceLocation,
                  ),
                  Marker(
                    markerId: MarkerId("destination"),
                    icon: destinationIcon,
                    position: destination,
                  ),
                },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
              ));
  }
}
