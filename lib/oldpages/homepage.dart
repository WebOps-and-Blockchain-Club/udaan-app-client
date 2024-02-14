import 'package:flutter/material.dart';
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
              'UDAAN',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    toggleLanguage();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    // width: 240,
                    width: screenWidth * 0.4,
                    // height: screenHeight * 0.3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        isEnglish
                            ? 'UDAAN AIMS TO HELP PEOPLE IN NEED. YOU CAN CALL FOR HELP USING SOS BUTTON'
                            : 'उदान किसी की मदद करने का उद्देश्य रखता है। आप सोस बटन का उपयोग करके मदद के लिए कॉल कर सकते हैं',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          letterSpacing: 1.1,
                          height: 1.1,
                          fontStyle: FontStyle.italic,
                          decorationColor: Colors.red,
                          decorationThickness: 1.0,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              color: Colors.white
                                  .withOpacity(0.5), // Adjust opacity as needed
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.5,
                  child: Image.asset(
                    "assets/image/logo_ncc.png",
                    scale: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          // Carousel with Event Cards
          EventCarousel(),
          const SizedBox(height: 30.0),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 0),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          elevation: 0,
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
          gradient: LinearGradient(
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
              style: TextStyle(
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
