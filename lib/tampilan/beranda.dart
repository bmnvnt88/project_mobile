// import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_bima/grid_detail.dart';
import 'package:project_bima/network/network_request.dart';
import '../model/photo.dart';
// import 'masuk.dart';
import 'package:flutter/material.dart';
import '../cell/grid_cell.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              gotoDetailPage(context, photo);
            },
          );
        }).toList(),
      ),
    );
  }

  gotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GridDetails(
                  photo,
                )));
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // appBar: AppBar(title: Text('Game Of Throne Characters')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return gridView(snapshot);
                }
                return circularProgress();
              }),
            ))
          ],
        ));
  }
}
