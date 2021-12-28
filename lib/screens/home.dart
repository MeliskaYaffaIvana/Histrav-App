import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/Screens/add_screen.dart';
import 'package:histrav_app_flutter/Screens/register_screnn.dart';
import 'package:histrav_app_flutter/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      const RegistrationScreen(),
      AddScreen(),
      const ProfileApp(),
    ];

    const _bottomNavBar = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        title: Text('Add'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text('Profile'),
      ),
    ];
    final _bottomBar = BottomNavigationBar(
      items: _bottomNavBar,
      currentIndex: _selectedNavbar,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.green,
      onTap: _changeSelectedNavBar,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('HisTrav'),
        backgroundColor: const Color(0xff61825F),
      ),
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: _bottomBar,
    );
  }
}
