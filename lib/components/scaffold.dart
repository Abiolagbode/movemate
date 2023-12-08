import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key? key,
      required this.child,
      this.backGroundColor,
      this.appbar,
      this.settingsappbar,
      this.questionappbar})
      : super(key: key);
  final Widget child;
  final backGroundColor;
  final appbar;
  final settingsappbar;
  final questionappbar;

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          backGroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            bottom: false,
            child: child,
          )),
    );
  }
}

void pushRoute(BuildContext context, dynamic route) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return route;
  }));
}

void pushOffRoute(BuildContext context, dynamic route) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return route;
  }), (Route<dynamic> route) => false);
}
