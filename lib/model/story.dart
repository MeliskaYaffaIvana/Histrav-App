import 'package:firebase_database/firebase_database.dart';

class Story {
  String _id;
  String _name;
  String _codebar;
  String _description;
  String _price;
  String _stock;
  String _StoryImage;

  Story(this._id, this._name, this._codebar, this._description, this._price,
      this._stock, this._StoryImage);

  Story.map(dynamic obj) {
    this._name = obj['name'];
    this._codebar = obj['codebar'];
    this._description = obj['description'];
    this._price = obj['price'];
    this._stock = obj['stock'];
    this._StoryImage = obj['StoryImage'];
  }

  String get id => _id;
  String get name => _name;
  String get codebar => _codebar;
  String get description => _description;
  String get price => _price;
  String get stock => _stock;
  String get StoryImage => _StoryImage;

  Story.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _codebar = snapshot.value['codebar'];
    _description = snapshot.value['description'];
    _price = snapshot.value['price'];
    _stock = snapshot.value['stock'];
    _StoryImage = snapshot.value['StoryImage'];
  }
}
