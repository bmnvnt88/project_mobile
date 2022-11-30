import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bima/main.dart';
import 'package:project_bima/tampilan/beranda.dart';
import 'package:project_bima/tampilan/info.dart';
// import 'package:project_bima/tampilan/masuk.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  late int index;
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final List<Widget> _pages = [Beranda(), Info()];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            // "Masuk sebagai ${user.email}",
            "Rick and Morty Character",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
          ),
          elevation: 0,
          // brightness: Brightness.light,
          backgroundColor: Color.fromARGB(255, 167, 50, 63),
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.arrow_back_ios,
          //     size: 20,
          //     color: Colors.black,),
          //
          //
          // ),
        ),
        body: _pages[index],
        bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(displayWidth * .23, displayWidth * .02,
              displayWidth * .23, displayWidth * .02),
          height: displayWidth * .155,
          // color: Colors.black,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5,
            ),
            child: GNav(
              // backgroundColor: Colors.black,
              tabBorderRadius: 25.0,
              color: Color.fromARGB(255, 167, 50, 63),
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 167, 50, 63),
              gap: 20,
              onTabChange: (value) {
                setState(() {
                  index = value;
                });
              },
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Info',
                ),
                // GButton(
                //   icon: Icons.logout,
                //   text: '',
                // ),
              ],
            ),
          ),
        ));
  }
}

// we will be creating a widget for text field
// Widget inputFile({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey[400]),
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey[400]))),
//       ),
//       SizedBox(
//         height: 10,
//       )
//     ],
//   );
// }
