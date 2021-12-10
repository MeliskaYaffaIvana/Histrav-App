import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Username
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Username',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              //Password
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                obscureText:
                    true, // agar teks yang diinput berubah jadi simbol *
              ),
              const SizedBox(
                height: 10.0,
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: () {},
                  child: const Text(
                    'Lupa Password ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Button login
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: RaisedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {},
                    child: const Text('Register'),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
