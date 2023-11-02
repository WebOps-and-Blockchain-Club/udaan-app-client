// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_flow_chart/flutter_flow_chart.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mapbox_turn_by_turn/oldpages/profile_model.dart';
// import 'package:provider/provider.dart';

// //import 'profile_model.dart';
// export 'profile_model.dart';

// class ProfileWidget extends StatefulWidget {
//   const ProfileWidget({Key? key}) : super(key: key);

//   @override
//   _ProfileWidgetState createState() => _ProfileWidgetState();
// }

// class _ProfileWidgetState extends State<ProfileWidget> {
//   late ProfileModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ProfileModel());
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }

//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         appBar: AppBar(
//           backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//           automaticallyImplyLeading: false,
//           leading: FlutterFlowIconButton(
//             borderRadius: 30,
//             buttonSize: 60,
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: FlutterFlowTheme.of(context).primaryText,
//               size: 30,
//             ),
//             onPressed: () {
//               print('IconButton pressed ...');
//             },
//           ),
//           title: Text(
//             'Profile',
//             style: FlutterFlowTheme.of(context).headlineMedium,
//           ),
//           actions: [],
//           centerTitle: false,
//           elevation: 0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: FlutterFlowTheme.of(context).secondaryBackground,
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Container(
//                           width: 72,
//                           height: 72,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).accent1,
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context).primary,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(40),
//                               child: Image.network(
//                                 'https://images.unsplash.com/photo-1579783900613-6eba8db797a8?w=1280&h=720',
//                                 width: 60,
//                                 height: 60,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Government App',
//                                 style: FlutterFlowTheme.of(context).labelMedium,
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                                 child: Text(
//                                   'Welcome, John Doe',
//                                   style: FlutterFlowTheme.of(context)
//                                       .headlineSmall,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
//                 child: Text(
//                   'Personal Information',
//                   style: FlutterFlowTheme.of(context).labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.account_circle_outlined,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Edit Profile',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.work_outline_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Employment Details',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
//                 child: Text(
//                   'Government Services',
//                   style: FlutterFlowTheme.of(context).labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.payment_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Pay Taxes',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.ballot_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Vote',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.local_hospital_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Healthcare',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
//                 child: Text(
//                   'Settings',
//                   style: FlutterFlowTheme.of(context).labelLarge,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.language_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Language',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Material(
//                   color: Colors.transparent,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     alignment: AlignmentDirectional(0.00, 0.00),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Icon(
//                             Icons.privacy_tip_rounded,
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             size: 24,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Text(
//                               'Privacy Policy',
//                               style: FlutterFlowTheme.of(context).labelMedium,
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: AlignmentDirectional(0.90, 0.00),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryText,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/services.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
              backgroundImage: AssetImage('assets/images/user.JPG'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', 'abc address, xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
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
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
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
