import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_bar.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_model.dart';
import 'package:mapbox_turn_by_turn/oldpages/eventDetails.dart';
import 'package:http/http.dart ' as http;
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'event_box.dart';
import '../main.dart';

String ngroklink = 'http://43.204.145.3:8000';
Future<void> fetchData() async {
<<<<<<< HEAD
  final response = await http
      .get(Uri.parse('https://ee8f-103-158-43-46.ngrok-free.app/api/v1/events'));
=======
  final response = await http.get(Uri.parse('$ngroklink/api/v1/events'));
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Failed to fetch data');
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
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          // color: Color.fromARGB(96, 50, 10, 134),
          weight: 14,
          opacity: 10,
        ),
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat design
        title: const Row(
          children: [
            Text(
              'EVENTS',
              style: TextStyle(
                color: Colors.white, // Set the title color
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.profileRoute);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(
                        'assets/image/person.jpg'), // Add your profile image path
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: const Text(
            //       "", //events written
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       //textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            // const Positioned(
            //   top: 40,
            //   left: 10,
            //   child: InkWell(
            //     child: Icon(
            //       CupertinoIcons.back,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const SizedBox(height: 80),
                    const SizedBox(height: 10),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 10),
                    //   alignment: Alignment.topLeft,
                    //   child: const Text(
                    //     "Past Events",
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //         fontSize: 24, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    CarouselSlider(
                      items: [
                        EventCard(
                          imageAsset: 'assets/image/leadership.jpg',
                          title: 'Leadership Workshop',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/leadership.jpg',
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
                        EventCard(
                          imageAsset: 'assets/image/adventurecamp.jpeg',
                          title: 'Adventure Camp',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/adventurecamp.jpeg',
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

                        EventCard(
                          imageAsset: 'assets/image/drill.jpg',
                          title: 'Drill Competition',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/drill.jpg',
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

                        EventCard(
                          imageAsset: 'assets/image/blood_donation.png',
                          title: 'Blood donation',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/blood_donation.png',
                                  title: 'Blood donation',
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

                        EventCard(
                          imageAsset: 'assets/image/award_dist.jpeg',
                          title: 'Award Distribution',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/award_dist.jpeg',
                                  title: 'Award Distribution',
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
                        EventCard(
                          imageAsset: 'assets/image/environmentcleanup.jpg',
                          title: 'Environmental Cleanup',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset:
                                      'assets/image/environmentcleanup.jpg',
                                  title: 'Environmental Cleanup',
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
                        EventCard(
                          imageAsset: 'assets/image/sports_day.jpeg',
                          title: 'Sports Day',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/sports_day.jpeg',
                                  title: 'Sports Day',
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
                        EventCard(
                          imageAsset: 'assets/image/Flag1.webp',
                          title: 'National Integration Camp',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsPage(
                                  imageAsset: 'assets/image/Flag1.webp',
                                  title: 'National Integration Camp',
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
                        EventCard(
                          imageAsset: 'assets/image/Events3.jpeg',
                          title: 'International Yoga Drive',
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
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.4,
                        initialPage: 2,
                        pageSnapping: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: 800,
                        height: 417,
                        child: ListView(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            // bottom: 20,
                          ),
                          scrollDirection: Axis.vertical,
                          //physics: AlwaysScrollableScrollPhysics(),
                          addRepaintBoundaries: true,
                          clipBehavior: Clip.hardEdge,
                          // shrinkWrap: true,
                          children: [
                            EventCardBox(
                              imageAsset: 'assets/image/environmentcleanup.jpg',
                              title: 'Environment Cleanup',
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
                                      imageAsset:
                                          'assets/image/environmentcleanup.jpg',
                                      title: 'Environment Cleanup',
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
                            EventCardBox(
                              imageAsset: 'assets/image/sports_day.jpeg',
                              title: 'Sports Day',
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
                                      imageAsset:
                                          'assets/image/sports_day.jpeg',
                                      title: 'Sports Day',
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
                            EventCardBox(
                              imageAsset: 'assets/image/blood_donation.png',
                              title: 'Blood Donation Drive',
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
                                          'assets/image/blood_donation.png',
                                      title: 'Blood Donation Drive',
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
                            EventCardBox(
                              imageAsset: 'assets/image/adventurecamp.jpeg',
                              title: 'Adventure Camp',
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
                                          'assets/image/adventurecamp.jpeg',
                                      title: 'Adventure Camp',
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
                            EventCardBox(
                              imageAsset: 'assets/image/award_dist.jpeg',
                              title: 'Award Distribution',
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
                                          'assets/image/award_dist.jpeg',
                                      title: 'Award Distribution',
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
                            EventCardBox(
                              imageAsset: 'assets/image/drill.jpg',
                              title: 'Drill Undertaking',
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
                                      imageAsset: 'assets/image/drill.jpg',
                                      title: 'Drill Undertaking',
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
                            EventCardBox(
                              imageAsset:
                                  'assets/image/First_Aid_Training.jpeg',
                              title: 'First Aid Training',
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
                                          'assets/image/First_Aid_Training.jpeg',
                                      title: 'First Aid Training',
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
                            EventCardBox(
                              imageAsset: 'assets/image/Events1.jpg',
                              title: 'Sports Meet',
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
                                      imageAsset: 'assets/image/Events1.jpg',
                                      title: 'Sports Meet',
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
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 4),
        height: 64,
        width: 64,
        child: FloatingActionButton(
            backgroundColor: Colors.red,
            elevation: 0,
            //onPressed: () => debugPrint("Add Button pressed"),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.sosRoute);
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              "SOS",
              style: TextStyle(color: Colors.white),
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
