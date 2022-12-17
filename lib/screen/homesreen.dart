// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hirexxo/model/user.dart';
// import 'package:hirexxo/screen/signIn.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }  

// class _HomeScreenState extends State<HomeScreen> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 150,
//                 child: Image.asset("assets/logo.png", fit: BoxFit.contain),
//               ),
//               const Text(
//                 "Welcome Back",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text("${loggedInUser.username}",
//                   // ${loggedInUser.secondName}",
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               Text("${loggedInUser.email}",
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               const SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                   label: const Text("Logout"),
//                   onPressed: () {
//                     logout(context);
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // the logout function
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const LoginScreen()));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hirexxo/model/user.dart';
import 'package:hirexxo/screen/bottom_navigation.dart';
import 'package:hirexxo/screen/drawer/drawer.dart';
import 'package:hirexxo/screen/signIn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HireXXo"),
        centerTitle: true,
      ),
      body: const RootApp(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const MyDrawerHeader(),
            //  Menu(),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('Apartments List'),
              onTap: () => Navigator.of(context).pushNamed('/lalitpur'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('Building List'),
              onTap: () => Navigator.of(context).pushNamed('/lalitpur'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('Rental Room List'),
              onTap: () => Navigator.of(context).pushNamed('/lalitpur'),
            ),
            ListTile(
              leading: const Icon(Icons.add_home),
              title: const Text(' Add '),
              onTap: () => Navigator.of(context).pushNamed('/addhostel'),
            ),
            ListTile(
              leading: const Icon(Icons.location_searching_sharp),
              title: const Text(' Map Navigation'),
              onTap: () => Navigator.of(context).pushNamed('/googlemap'),
            ),
            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(' Send Feedback '),
              onTap: () => Navigator.of(context).pushNamed('/feedback'),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () => Navigator.of(context).pushNamed('/'),
            ),
          ],
        ),
      ), //Deawer
      //Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 150,
      //           child: Image.asset("assets/images/welcome.jpg",
      //               fit: BoxFit.contain),
      //         ),
      //         const Text(
      //           "Welcome Back",
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         Text("${loggedInUser.email}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         ActionChip(
      //             label: const Text("Logout"),
      //             onPressed: () {
      //               logout(context);
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
