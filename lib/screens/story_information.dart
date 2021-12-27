import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:histrav_app_flutter/model/story.dart';

class StoryInformation extends StatefulWidget {
  final story Story;
  StoryInformation(this.Story);
  @override
  _StoryInformationState createState() => _StoryInformationState();
}

final StoryReference = FirebaseDatabase.instance.reference().child('Story');

class _StoryInformationState extends State<StoryInformation> {
  List<Story> items;

  String storyImage; //nuevo

  @override
  void initState() {
    super.initState();
    StoryImage = widget.Story.StoryImage; //nuevo
    print(StoryImage); //nuevo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Information y Foto'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(
                  "Name : ${widget.Story.name}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  "Codebar : ${widget.Story.codebar}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  "Description : ${widget.Story.description}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  "Price : ${widget.Story.price}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  "Stock : ${widget.Story.stock}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                Container(
                  height: 300.0,
                  width: 300.0,
                  child: Center(
                    child: StoryImage == ''
                        ? Text('No Image')
                        : Image.network(StoryImage +
                            '?alt=media'), //nuevo para traer la imagen de firestore
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
