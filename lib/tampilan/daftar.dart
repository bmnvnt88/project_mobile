import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:project_bima/homePage.dart';
import '../reusable_widget/reusable_widget.dart';
import '../utils/color_utils.dart';
// import 'beranda.dart';
import 'masuk.dart';

class Daftar extends StatefulWidget {
  const Daftar({Key? key}) : super(key: key);

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("ff7988"),
          // hexStringToColor("9546C4"),
          hexStringToColor("89000f")
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Masukkan Nama Pengguna",
                    Icons.person_outline, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Masukkan Email", Icons.alternate_email,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Masukkan Kata Sandi", Icons.lock_outlined,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () async {
                  await FirebaseAuth.instance.signOut();
                  if (FirebaseAuth.instance.currentUser == null) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Masuk()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    } on FirebaseAuthException catch (e) {
                      // showNotification(context, e.message.toString());
                    }
                  } else {
                    await FirebaseAuth.instance.signOut();
                  }
                }),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Sudah punya akun?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Masuk()));
          },
          child: const Text(
            " Masuk",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

// Widget forgetPassword(BuildContext context) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 35,
//     alignment: Alignment.bottomRight,
//     child: TextButton(
//       child: const Text(
//         "Forgot Password?",
//         style: TextStyle(color: Colors.white70),
//         textAlign: TextAlign.right,
//       ),
//       onPressed: () => Navigator.push(
//           context, MaterialPageRoute(builder: (context) => ResetPassword())),
//     ),
//   );
// }
}
