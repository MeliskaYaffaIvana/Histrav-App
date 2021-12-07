import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/icons/my_flutter_app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'what would you like to upload?',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.search,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.local_pizza,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.account_circle,
            ),
          )
        ],
      ),
    );
  }
}
