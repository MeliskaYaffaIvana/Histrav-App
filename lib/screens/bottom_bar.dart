import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/profile/profile.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({Key? key}) : super(key: key);

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
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
      ),
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: _bottomBar,
    );
  }
}
