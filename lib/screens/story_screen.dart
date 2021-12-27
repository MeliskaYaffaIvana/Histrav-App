import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:histrav_app_flutter/model/crud.dart';
//nuevo para imagenes
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

File image;
String filename;

class StoryScreen extends StatefulWidget {
  final Story Story;
  StoryScreen(this.Story);
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

final StoryReference = FirebaseDatabase.instance.reference().child('Story');

class _StoryScreenState extends State<StoryScreen> {

  List<Story> items;

  TextEditingController _nameController;
  TextEditingController _codebarController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;
  TextEditingController _stockController;
  
   //nuevo imagen
  String StoryImage;

  pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }
  
  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }
  //fin nuevo imagen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController(text: widget.Story.name);
    _codebarController = new TextEditingController(text: widget.Story.codebar);
    _descriptionController = new TextEditingController(text: widget.Story.description);
    _priceController = new TextEditingController(text: widget.Story.price);
    _stockController = new TextEditingController(text: widget.Story.stock);
    StoryImage = widget.Story.StoryImage;
    print(StoryImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Storys'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
       
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null ? Text('Add') : Image.file(image),                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.2),
                      child: new Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        padding: new EdgeInsets.all(5.0),
                        child: StoryImage == '' ? Text('Edit') : Image.network(StoryImage+'?alt=media'),
                      ),
                    ),
                    Divider(),
                    //nuevo para llamar imagen de la galeria o capturarla con la camara
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), onPressed: pickerCam),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: pickerGallery),
                  ],
                ),
                TextField(
                  controller: _nameController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Name'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _codebarController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'CodeBar'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _descriptionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Description'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _priceController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'Price'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _stockController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.shop), labelText: 'Stock'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      //nuevo imagen
                      if (widget.Story.id != null) {
                        var now = formatDate(
                            new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                        var fullImageName =
                            '${_nameController.text}-$now' + '.jpg';
                        var fullImageName2 =
                            '${_nameController.text}-$now' + '.jpg';

                        final StorageReference ref =
                            FirebaseStorage.instance.ref().child(fullImageName);
                        final StorageUploadTask task = ref.putFile(image);

                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/';//esto cambia segun su firestore

                        var fullPathImage = part1 + fullImageName2;

                        StoryReference.child(widget.Story.id).set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'StoryImage': '$fullPathImage'
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        //nuevo imagen
                        var now = formatDate(
                            new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                        var fullImageName =
                            '${_nameController.text}-$now' + '.jpg';
                        var fullImageName2 =
                            '${_nameController.text}-$now' + '.jpg';

                        final StorageReference ref =
                            FirebaseStorage.instance.ref().child(fullImageName);
                        final StorageUploadTask task = ref.putFile(image);

                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/'; //esto cambia segun su firestore                           

                        var fullPathImage = part1 + fullImageName2;

                        StoryReference.push().set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'StoryImage': '$fullPathImage'//nuevo imagen
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.Story.id != null)
                        ? Text('Update')
                        : Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
