import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final List<String> imageUrls = [
    'assets/image/Events1.jpg',
    'assets/image/Events2.jpg',
    'assets/image/Events4.jpeg',
    'assets/image/drill.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Icon(
                    Icons.menu_sharp,
                    size: 40,
                  ),
                  Row(
                    children: [
                      Icon(
                          Icons.account_circle,
                          size: 40,
                      )
                    ],
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Featured Events",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      TextButton(
                          onPressed: (){print("pressed view all");},
                          child: Text("view all",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 170,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/image/person.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Background image container
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          // White box at the left-bottom
                          Positioned(
                            left: 6,
                            bottom: 6,
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Text('10', style: TextStyle(
                                    fontSize: 18
                                  )),
                                  Text('Mar', style: TextStyle(
                                      fontSize: 18
                                  )),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            top: -5,
                            right: 15,
                            child: Container(
                              child: Icon(Icons.bookmark,
                                color: Colors.white,
                                size: 35,
                              )
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: screenWidth*0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0.4,
                                blurRadius: 3,
                                offset: Offset(0, 5)
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NCC Plantation Drive",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            )),
                            Text("Udyaan Marg",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Upcoming Events",
                        style:
                        TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                      ),
                    ]),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.4,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              image: DecorationImage(
                                image: AssetImage(imageUrls[index]), // Use NetworkImage instead
                                fit: BoxFit.cover, // Adjust the fit based on your requirement
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('National Cadets Day',
                              style: TextStyle(fontSize: 15)),
                              Text(
                                'Thu, Feb 8 at 5:00 PM',
                                style: TextStyle(color: Colors.red.shade300),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}