import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../reusable_widget/reusable_widget.dart';
import 'masuk.dart';

class Info extends StatelessWidget {
  // const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GridView.count(
            padding: EdgeInsets.all(25),
            crossAxisCount: 1,
            children: <Widget>[
              Card(
                //daftar anggota
                margin: EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Cara Penggunaan",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      firebaseUIButton(context, "Sign Out", () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Masuk()));
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
