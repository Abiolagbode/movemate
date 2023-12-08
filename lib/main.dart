import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movemate/colors.dart';

import 'views/onboarding/app_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'movemate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: PRIMARY40,
          useMaterial3: true,
          fontFamily: 'Crique',
          appBarTheme: AppBarTheme(color: DARK),
          scaffoldBackgroundColor: BACKGROUND,
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: PRIMARY_COLOR1, background: WHITE, error: RED),
        ),
        home: AppHome());
  }
}
