import 'package:flutter/material.dart';
import 'package:marier_shoping/main.dart';
import 'package:marier_shoping/auth/sign_in.dart';

void main() {
  runApp(Landing());
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _decideMainPage(),
    );
  }

  _decideMainPage() {
    // if (true) {
    // return MainPage();
    // } else {
    // return SignInPage();
    // }

    // return SignInPage();
    return MainPage();
  }
}
