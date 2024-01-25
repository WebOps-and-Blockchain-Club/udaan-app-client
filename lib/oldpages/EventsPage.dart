// // ignore_for_file: unused_import

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
// //import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
// import 'package:mapbox_turn_by_turn/oldpages/bottombar.dart';
// import 'package:mapbox_turn_by_turn/widgets/api.dart';
// import 'package:mapbox_turn_by_turn/oldpages/nav_bar.dart';
// import 'package:mapbox_turn_by_turn/oldpages/nav_model.dart';
// import 'package:http/http.dart ' as http;

// Future<void> fetchData() async {
//   final response = await http
//       .get(Uri.parse('https://2ae2-103-158-43-17.ngrok.io/api/v1/events'));
//   if (response.statusCode == 200) {
//     print(response.body);
//   } else {
//     print('Failed to fetch data');
//   }
// }

// class EventBox extends StatelessWidget {
//   final String eventName;
//   final String imageAsset; // Add this line

//   EventBox({required this.eventName, required this.imageAsset});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 200,
//       padding: const EdgeInsets.all(4),
//       //decoration: BoxDecoration(
//       //borderRadius: BorderRadius.circular(10),
//       //color: Colors.transparent,
//       //),
//       color: Colors.transparent,
//       child: Image.asset(
//         imageAsset,
//         //width: double.infinity,
//         height: double.infinity,
//         fit: BoxFit.fitHeight,
//       ),
//     );
//   }
// }

// class EventsPage extends StatefulWidget {
//   const EventsPage({Key? key}) : super(key: key);

//   @override
//   State<EventsPage> createState() => _EventsPageState();
// }

// class _EventsPageState extends State<EventsPage> {
//   final homeNavKey = GlobalKey<NavigatorState>();
//   final searchNavKey = GlobalKey<NavigatorState>();
//   final notificationNavKey = GlobalKey<NavigatorState>();
//   final profileNavKey = GlobalKey<NavigatorState>();
//   int selectedTab = 0;
//   List<NavModel> items = [];

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//     items = [
//       NavModel(
//         page: const TabPage(tab: 1),
//         navKey: homeNavKey,
//       ),
//       NavModel(
//         page: const TabPage(tab: 2),
//         navKey: searchNavKey,
//       ),
//       NavModel(
//         page: const TabPage(tab: 3),
//         navKey: notificationNavKey,
//       ),
//       NavModel(
//         page: const TabPage(tab: 4),
//         navKey: profileNavKey,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             // gradient: LinearGradient(
//             //   begin: Alignment.topCenter,
//             //   end: Alignment.bottomCenter,
//             //   colors: [Colors.blueAccent, Colors.white],
//             // ),
//             ),
//         child: Stack(
//           children: [
//             //Padding(padding: EdgeInsets.only(top: 10, left: 100)),
//             Positioned(
//               top: 40,
//               left: 0,
//               right: 0,
//               child: Container(
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "EVENTS",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   //textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             const Positioned(
//               top: 40,
//               left: 10,
//               child: InkWell(
//                 child: Icon(
//                   CupertinoIcons.back,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             // const Center(
//             //   child: Text(
//             //     "EVENTS",
//             //     style: TextStyle(
//             //       fontSize: 24,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             //   ),
//             // ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 80),
//                   Container(
//                     padding: const EdgeInsets.only(left: 10),
//                     alignment: Alignment.topLeft,
//                     child: const Text(
//                       "Past Events",
//                       textAlign: TextAlign.left,
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   CarouselSlider(
//                     items: [
//                       EventBox(
//                         eventName: "Event 1",
//                         imageAsset: "assets/image/Events1.jpg",
//                       ),
//                       EventBox(
//                         eventName: "Event 2",
//                         imageAsset: "assets/image/Events2.jpg",
//                       ),
//                       EventBox(
//                         eventName: "Event 3",
//                         imageAsset: "assets/image/Events3.jpeg",
//                       ),
//                       // Events can be added more
//                     ],
//                     options: CarouselOptions(
//                       aspectRatio: 2.0,
//                       enlargeCenterPage: false,
//                       enableInfiniteScroll: false,
//                       viewportFraction: 0.6,
//                       pageSnapping: false,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     padding: const EdgeInsets.only(left: 8),
//                     alignment: Alignment.centerLeft,
//                     child: const Text(
//                       "Upcoming Events",
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   SingleChildScrollView(
//                     child: Container(
//                       width: 800,
//                       height: 450,
//                       child: ListView(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                           right: 15,
//                           bottom: 20,
//                         ),
//                         scrollDirection: Axis.vertical,
//                         //physics: AlwaysScrollableScrollPhysics(),
//                         addRepaintBoundaries: true,
//                         //clipBehavior: Clip.hardEdge,
//                         shrinkWrap: true,
//                         children: [
//                           EventBox(
//                             eventName: "Upcoming Event 1",
//                             imageAsset: "assets/image/Events3.jpeg",
//                           ),
//                           EventBox(
//                             eventName: "Upcoming Event 2",
//                             imageAsset: "assets/image/Events4.jpeg",
//                           ),
//                           EventBox(
//                             eventName: "Upcoming Event 3",
//                             imageAsset:
//                                 "assets/image/indian-flag-2644512_1280.jpeg",
//                           ),
//                           // Events can be added more
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 1,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         margin: const EdgeInsets.only(top: 10),
//         height: 64,
//         width: 64,
//         child: FloatingActionButton(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             //onPressed: () => debugPrint("Add Button pressed"),
//             onPressed: () {
//               Navigator.pushNamed(context, MyRoutes.sosRoute);
//             },
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(width: 3, color: Colors.blue),
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: const Text(
//               "SOS",
//               style: TextStyle(color: Colors.black),
//             )),
//       ),
//       bottomNavigationBar: NavBar(
//         pageIndex: selectedTab,
//         onTap: (index) {
//           if (index == selectedTab) {
//             items[index]
//                 .navKey
//                 .currentState
//                 ?.popUntil((route) => route.isFirst);
//           } else {
//             setState(() {
//               selectedTab = index;
//             });
//           }
//         },
//       ),
//     );
//   }
// }

// class TabPage extends StatelessWidget {
//   final int tab;

//   const TabPage({Key? key, required this.tab}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tab $tab')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Tab $tab'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Page(tab: tab),
//                   ),
//                 );
//               },
//               child: const Text('Go to page'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Page extends StatelessWidget {
//   final int tab;

//   const Page({super.key, required this.tab});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page Tab $tab')),
//       body: Center(child: Text('Tab $tab')),
//     );
//   }
// }
// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/oldpages/bottombar.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_bar.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_model.dart';
import 'package:mapbox_turn_by_turn/oldpages/eventDetails.dart';
import 'package:http/http.dart ' as http;

Future<void> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://f32d-2409-40d1-102f-dd12-74bf-ee68-e476-74f5.ngrok-free.app/api/v1/events'));
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Failed to fetch data');
  }
}

class EventBox extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String location;
  final String date;
  final String description;
  final String registrationlink;
  final VoidCallback onTap;

  const EventBox(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.location,
      required this.date,
      required this.description,
      required this.registrationlink,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap callback
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(4),
        color: Colors.transparent,
        child: Image.asset(
          imageAsset,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
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
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    fetchData();
    super.initState();
    items = [
      NavModel(
        page: const TabPage(tab: 1),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 3),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 4),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Colors.blueAccent, Colors.white],
            // ),
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
                        title: "Leadership Workshop",
                        imageAsset: 'assets/image/Events1.jpg',
                        location: 'NCC Training Grounds',
                        date: '2023-11-15',
                        description:
                            'Enhance your leadership skills with interactive workshops and real-world scenarios.',
                        registrationlink:
                            'https://example.com/leadership-workshop',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventDetailsPage(
                                imageAsset: 'assets/image/Events1.jpg',
                                title: 'Leadership Workshop',
                                location: 'NCC Training Grounds',
                                date: '2023-11-15',
                                description:
                                    'Enhance your leadership skills with interactive workshops and real-world scenarios.',
                                registrationlink:
                                    'https://example.com/leadership-workshop',
                              ),
                            ),
                          );
                        },
                      ),

                      EventBox(
                        title: "Adventure Camp",
                        imageAsset: 'assets/image/Events2.jpg',
                        location: 'Mount Adventure Base',
                        date: '2023-12-02',
                        description:
                            'Embark on an adventurous journey with fellow cadets. Learn survival skills and team building.',
                        registrationlink: 'https://example.com/adventure-camp',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventDetailsPage(
                                imageAsset: 'assets/image/Events2.jpg',
                                title: 'Adventure Camp',
                                location: 'Mount Adventure Base',
                                date: '2023-12-02',
                                description:
                                    'Embark on an adventurous journey with fellow cadets. Learn survival skills and team building.',
                                registrationlink:
                                    'https://example.com/adventure-camp',
                              ),
                            ),
                          );
                        },
                      ),

                      EventBox(
                        title: "Drill Competition",
                        imageAsset: 'assets/image/Events3.jpeg',
                        location: 'Parade Ground',
                        date: '2023-11-30',
                        description:
                            'Showcase your precision and discipline in the annual drill competition. Trophies and recognition await!',
                        registrationlink:
                            'https://example.com/drill-competition',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventDetailsPage(
                                imageAsset: 'assets/image/Events3.jpeg',
                                title: 'Drill Competition',
                                location: 'Parade Ground',
                                date: '2023-11-30',
                                description:
                                    'Showcase your precision and discipline in the annual drill competition. Trophies and recognition await!',
                                registrationlink:
                                    'https://example.com/drill-competition',
                              ),
                            ),
                          );
                        },
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
                      height: 320,
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
                            title: "Blood Donation Drive",
                            imageAsset: 'assets/image/Events4.jpeg',
                            location: 'NCC Community Center',
                            date: '2023-12-18',
                            description:
                                'Contribute to a noble cause. Join us in saving lives through voluntary blood donations.',
                            registrationlink:
                                'https://example.com/blood-donation-drive',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EventDetailsPage(
                                    imageAsset: 'assets/image/Events4.jpeg',
                                    title: 'Blood Donation Drive',
                                    location: 'NCC Community Center',
                                    date: '2023-12-18',
                                    description:
                                        'Contribute to a noble cause. Join us in saving lives through voluntary blood donations.',
                                    registrationlink:
                                        'https://example.com/blood-donation-drive',
                                  ),
                                ),
                              );
                            },
                          ),
                          EventBox(
                            title: "Environmental Cleanup Campaign",
                            imageAsset:
                                'assets/image/indian-flag-2644512_1280.jpeg',
                            location: 'City Park',
                            date: '2023-11-25',
                            description:
                                'Join hands to make a positive impact on the environment. Let\'s keep our surroundings clean and green.',
                            registrationlink:
                                'https://example.com/environmental-cleanup',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EventDetailsPage(
                                    imageAsset:
                                        'assets/image/indian-flag-2644512_1280.jpeg',
                                    title: 'Environmental Cleanup Campaign',
                                    location: 'City Park',
                                    date: '2023-11-25',
                                    description:
                                        'Join hands to make a positive impact on the environment. Let\'s keep our surroundings clean and green.',
                                    registrationlink:
                                        'https://example.com/environmental-cleanup',
                                  ),
                                ),
                              );
                            },
                          ),
                          EventBox(
                            title: "Sports Meet",
                            imageAsset: 'assets/image/Events3.jpeg',
                            location: 'NCC Sports Complex',
                            date: '2023-12-10',
                            description:
                                'Unleash your sportsmanship! Participate in a variety of sports and showcase your athletic prowess.',
                            registrationlink: 'https://example.com/sports-meet',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EventDetailsPage(
                                    imageAsset: 'assets/image/Events3.jpeg',
                                    title: 'Sports Meet',
                                    location: 'NCC Sports Complex',
                                    date: '2023-12-10',
                                    description:
                                        'Unleash your sportsmanship! Participate in a variety of sports and showcase your athletic prowess.',
                                    registrationlink:
                                        'https://example.com/sports-meet',
                                  ),
                                ),
                              );
                            },
                          ),

                          // Events can be added more
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            //onPressed: () => debugPrint("Add Button pressed"),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.sosRoute);
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              "SOS",
              style: TextStyle(color: Colors.black),
            )),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page(tab: tab),
                  ),
                );
              },
              child: const Text('Go to page'),
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}
