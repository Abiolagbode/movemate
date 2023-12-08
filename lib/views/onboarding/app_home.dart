import 'package:flutter/material.dart';

import 'splash.dart';

class AppHome extends StatefulWidget {
  AppHome({
    Key? key,
  }) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String selectedLanguage = "EN";

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
