import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_turn_by_turn/helpers/shared_prefs.dart';
//import 'package:mapbox_turn_by_turn/screens/loading_screen.dart';
import 'package:mapbox_turn_by_turn/ui/rate_ride.dart';
//import 'package:camera_android/camera_android.dart';

//import 'package:flutter_mapbox_navigation/library.dart';

//import 'package:flutter_mapbox_navigation/models/routeLeg.dart';
class TurnByTurn extends StatefulWidget {
  const TurnByTurn({Key? key}) : super(key: key);

  @override
  State<TurnByTurn> createState() => _TurnByTurnState();
}

class _TurnByTurnState extends State<TurnByTurn> {
  // Waypoints to mark trip start and end
  LatLng source = getTripLatLngFromSharedPrefs('source');
  LatLng destination = getTripLatLngFromSharedPrefs('destination');
  late WayPoint sourceWaypoint, destinationWaypoint;
  var wayPoints = <WayPoint>[];
  // Config variables for Mapbox Navigation
  late MapBoxNavigation directions;
  late MapBoxOptions _options;
  late double distanceRemaining, durationRemaining;
  late MapBoxNavigationViewController _controller;
  final bool isMultipleStop = false;
  String instruction = "";
  bool arrived = false;
  bool routeBuilt = false;
  bool isNavigating = false;
  late LatLng latlng;
  late double a = source.latitude;
  late double b = source.longitude;
  late double c = destination.latitude;
  late double d = destination.longitude;
  // @override
  // Widget build(BuildContext context) {
  //   return const RateRide();
  // }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    if (!mounted) return;

    // Setup directions and options
    //directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
    //directions = MapBoxNavigation();
    _options = MapBoxOptions(
        zoom: 5.0,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        isOptimized: true,
        units: VoiceUnits.metric,
        simulateRoute: true,
        // enableRefresh: true,
        // animateBuildRoute: true,
        alternatives: true,
        language: "en");

    // Configure waypoints
    sourceWaypoint = WayPoint(name: "Source", latitude: a, longitude: b);
    destinationWaypoint =
        WayPoint(name: "Destination", latitude: c, longitude: d);
    wayPoints.add(sourceWaypoint);
    wayPoints.add(destinationWaypoint);
    directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);

    // Start the trip
    await directions.startNavigation(wayPoints: wayPoints, options: _options);
    try {
      //await directions.startNavigation(wayPoints: wayPoints, options: _options);
      await directions.startNavigation(wayPoints: wayPoints, options: _options);
    } catch (e) {
      //print("Error initializing navigation: $e");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Navigation error'),
              content:
                  Text('An error occured while initializing navigation: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const RateRide();
  }

  Future<void> _onRouteEvent(e) async {
    distanceRemaining = (await directions.distanceRemaining);
    durationRemaining = (await directions.durationRemaining);

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        arrived = progressEvent.arrived!;
        if (progressEvent.currentStepInstruction != null) {
          instruction = progressEvent.currentStepInstruction!;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        routeBuilt = true;
        break;
      case MapBoxEvent.route_build_failed:
        routeBuilt = false;
        break;
      case MapBoxEvent.navigation_running:
        isNavigating = true;
        break;
      case MapBoxEvent.on_arrival:
        arrived = true;
        if (!isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
        routeBuilt = false;
        isNavigating = false;
        break;
      case MapBoxEvent.navigation_cancelled:
        routeBuilt = false;
        isNavigating = false;
        break;
      default:
        break;
    }
    //refresh UI
    //setState(() {});
  }
}
