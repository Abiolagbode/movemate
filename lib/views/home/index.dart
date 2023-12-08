import 'dart:async';

import 'package:movemate/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:movemate/views/home/CustomAppNav.dart';

class DashboardEntry extends StatefulWidget {
  DashboardEntry({Key? key, this.initialTab = 0}) : super(key: key);
  final int initialTab;
  @override
  _DashboardEntryState createState() => _DashboardEntryState();
}

class _DashboardEntryState extends State<DashboardEntry>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("InitState");
  }

  @override
  void deactivate() {
    print("Deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Dispose");
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  Duration setDuration = Duration(minutes: 8);
  Duration endDuration = Duration(minutes: 0);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive and counting');
        break;
      case AppLifecycleState.resumed:
        print("ready to logout");

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }), (Route<dynamic> route) => false);

        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused and counting');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      print("should ready now");
    });
    return CustomAppBarNav(setPage: widget.initialTab);
  }
}
