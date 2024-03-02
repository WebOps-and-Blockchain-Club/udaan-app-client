import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_turn_by_turn/oldpages/event_box.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_bar.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_model.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  ///////////////////////////////////////////
  // FIREBASE MESSAGING

  // In this example, suppose that all messages contain a data field with the key 'type'.
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    void _handleMessage(RemoteMessage message) {
      if (message.notification != null) {
        Navigator.pushNamed(
          context,
          "/accdec",
          arguments: message,
        );
      }
    }

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  /////////////////////////////////////////////////

  bool isEnglish = true;
  void toggleLanguage() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    setupInteractedMessage();
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.drawerRoute);
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        size: 36,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 36,
                      // yet to do: apply the toggle active notification icon
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 4.0),
                child: Text(
                  "Search For Something",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Search Text",
                    hintStyle: TextStyle(
                        color: Colors.grey, letterSpacing: 1.0, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      size: 34,
                      color: Colors.blue,
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 20, right: 12, top: 10, bottom: 10),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color(0xFFF8CD9E)),
                          width: screenWidth * 0.42,
                          height: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital,
                                size: 90,
                                color: Color(0xFFE96362),
                              ),
                              const Text('Medical',
                                  style: TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.eventsRoutes);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color(0xFFAEDEFF)),
                            width: screenWidth * 0.42,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.event,
                                  size: 90,
                                  color: Colors.blue.shade900,
                                ),
                                const Text(
                                  'Events',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: ()  {
                            Navigator.pushNamed(context,MyRoutes.chatRoutes);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color(0xFFBAF2BB)),
                            width: screenWidth * 0.42,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.rate_review,
                                  size: 90,
                                  color: Colors.green.shade900,
                                ),
                                const Text(
                                  'Chat',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color(0xFFD4BFF4)),
                          width: screenWidth * 0.42,
                          height: 180,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_balance,
                                size: 90,
                                color: Colors.purple.shade800,
                              ),
                              const Text(
                                'Donate Us',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 25),
        height: 84,
        width: 84,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
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
          ),
        ),
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

class EventCarousel extends StatelessWidget {
  final List<String> eventImages = [
    "assets/image/blood_donation.png",
    "assets/image/Events2.jpg",
    "assets/image/award_dist.jpeg",
    "assets/image/environmentcleanup.jpg",
    "assets/image/adventurecamp.jpeg",
    "assets/image/First_Aid_Training.jpeg",
  ];

  final List<String> eventNames = [
    "BLOOD DONATION",
    "NCC PARADE",
    "AWARD CEREMONY",
    "Environmental Cleanup",
    "Adventure",
    "First Aid",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.eventsRoutes);
      },
      child: Container(
        // margin: const EdgeInsets.only(left: 4.0, right: 4.0),
        height: 340,
        width: double.infinity,
        // width: screenWidth * 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CarouselSlider.builder(
          itemCount: eventImages.length,
          options: CarouselOptions(
            height: 380,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 3,
            onPageChanged: (index, reason) {},
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildEventCard(eventImages[index], eventNames[index]);
          },
        ),
      ),
    );
  }

  Widget _buildEventCard(String imagePath, String eventName) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black87],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              eventName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
