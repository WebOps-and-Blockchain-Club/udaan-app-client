import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_turn_by_turn/helpers/mapbox_handler.dart';
import 'package:mapbox_turn_by_turn/helpers/shared_prefs.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
//import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/review_ride.dart';

//import 'package:camera_android/camera_android.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

LatLng fixedSource = const LatLng(13.054976, 80.278294);
LatLng fixedDestination = const LatLng(12.991989, 80.230965);

class _HomeState extends State<Home> {
  LatLng currentLocation = getCurrentLatLngFromSharedPrefs();
  late String currentAddress;
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    //_initialCameraPosition = CameraPosition(target: currentLocation, zoom: 14);
    _initialCameraPosition = CameraPosition(target: currentLocation, zoom: 14);
    currentAddress = getCurrentAddressFromSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MapboxMap(
          accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
          initialCameraPosition: _initialCameraPosition,
          myLocationEnabled: true,
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Hi there!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text('You are currently here:'),
                      Text(currentAddress,
                          style: const TextStyle(color: Colors.indigo)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PrepareRide())),
                        // style: ElevatedButton.styleFrom(
                        //     padding: const EdgeInsets.all(20)),
                        // child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text('Start Your Help'),
                        //     ])
                        // onPressed: () async {
                        //   // LatLng fixedSource =
                        //   //     const LatLng(13.054976, 80.278294);
                        //   // LatLng fixedDestination =
                        //   //     const LatLng(12.991989, 80.230965);
                        //   Map modifiedResponse = await getDirectionsAPIResponse(
                        //       fixedSource, fixedDestination);
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => ReviewRide(
                        //           modifiedResponse: modifiedResponse),
                        //     ),
                        //   );
                        // },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Track Your Help'),
                          ],
                        ),

                        // onPressed: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const PrepareRide())),
                        // style: ElevatedButton.styleFrom(
                        //     padding: const EdgeInsets.all(20)),
                        // child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text('Start Your Help'),
                        //     ])
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
