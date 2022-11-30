import 'package:flutter/material.dart';
import 'model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  const GridDetails(@required this.photo);

  @override
  State<GridDetails> createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(50, 255, 255, 255),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "image${widget.photo.name}",
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/no-image.png",
                    image: "${widget.photo.image}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              )),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${widget.photo.name}",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1),
                child: Text(
                  "Title: ${widget.photo.status}\nFamily: ${widget.photo.species}",
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(1),
              //   child: Text(
              //     "Gender: ${widget.photo.gender}     Location: ${widget.photo.location}",
              //     maxLines: 1,
              //     softWrap: true,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 15),
              //   ),
              // ),
              SizedBox(height: 30),
              OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close_rounded))
            ]),
      ),
    );
  }
}
