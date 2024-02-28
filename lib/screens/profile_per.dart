import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mapbox_turn_by_turn/oldpages/signinpage.dart';

//import 'package:flutter/services.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(username: ''),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  // ProfileScreen(this.username);
  final String username;
  const ProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image/Events1.jpg'),
            ),
            const SizedBox(height: 20),
            //username = "Abhishek";
            itemProfile('Name', username, CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '9646071964', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Rich Palace,Bhatinda,Punjab',
                CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'developerdikshant@gmail.com', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.blue.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
// style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40),
//                         )

//                         //foregroundColor: Colors.black,
//                         ),
// tujh jaisa rand maa ka loda