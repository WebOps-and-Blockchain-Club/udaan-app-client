// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/oldpages/bottombar.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

class EventBox extends StatelessWidget {
  final String eventName;
  final String imageAsset; // Add this line

  EventBox({required this.eventName, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(4),
      //decoration: BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      //color: Colors.transparent,
      //),
      color: Colors.transparent,
      child: Image.asset(
        imageAsset,
        //width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            //Padding(padding: EdgeInsets.only(top: 10, left: 100)),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "EVENTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  //textAlign: TextAlign.center,
                ),
              ),
            ),
            const Positioned(
              top: 40,
              left: 10,
              child: InkWell(
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
              ),
            ),
            // const Center(
            //   child: Text(
            //     "EVENTS",
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Past Events",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      EventBox(
                        eventName: "Event 1",
                        imageAsset: "assets/image/Events1.jpg",
                      ),
                      EventBox(
                        eventName: "Event 2",
                        imageAsset: "assets/image/Events2.jpg",
                      ),
                      EventBox(
                        eventName: "Event 3",
                        imageAsset: "assets/image/Events3.jpeg",
                      ),
                      // Events can be added more
                    ],
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.6,
                      pageSnapping: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Upcoming Events",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: 800,
                      height: 380,
                      child: ListView(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 20,
                        ),
                        scrollDirection: Axis.vertical,
                        //physics: AlwaysScrollableScrollPhysics(),
                        addRepaintBoundaries: true,
                        //clipBehavior: Clip.hardEdge,
                        shrinkWrap: true,
                        children: [
                          EventBox(
                            eventName: "Upcoming Event 1",
                            imageAsset: "assets/image/Events3.jpeg",
                          ),
                          EventBox(
                            eventName: "Upcoming Event 2",
                            imageAsset: "assets/image/Events4.jpeg",
                          ),
                          EventBox(
                            eventName: "Upcoming Event 3",
                            imageAsset:
                                "assets/image/indian-flag-2644512_1280.jpeg",
                          ),
                          // Events can be added more
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavibar(),
    );
  }
}
