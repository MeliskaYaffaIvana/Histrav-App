import 'dart:ui';

import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const routeName = "/registerPage";

  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  _iconRegister(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconRegister() {
    return Image.asset(
      "assets/images/icon_register.jpg",
      width: 150,
      height: 150,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: const [
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Text(
          "Registration",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        Text(
          "regislah masa enggak",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Username",
            hintStyle: TextStyle(
              color: Colors.amber,
            ),
            labelStyle: TextStyle(color: Colors.white),
          ),
          scrollPadding: const EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.amber,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Confirm Password",
            hintStyle: TextStyle(
              color: Colors.amber,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        const Text(
          'or',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 12.0,
          ),
        ),
        FlatButton(
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}
