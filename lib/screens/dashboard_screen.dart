import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/Screens/add_screen.dart';
import 'package:histrav_app_flutter/widget/item_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // ignore: unused_field
  final FocusNode _nameFocusNode = FocusNode();
  // ignore: unused_field
  final FocusNode _emailFocusNode = FocusNode();
  // ignore: unused_field
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCEEEDD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff61825F),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xffCEEEDD),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemList(),
        ),
      ),
    );
  }
}
