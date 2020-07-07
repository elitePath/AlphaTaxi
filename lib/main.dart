import 'package:alpha_taxi/routes.dart';
import 'package:alpha_taxi/screens/splash-screen.dart';
import 'package:alpha_taxi/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/default.dart';

void main() {
  // Register all the models and services before the app starts

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainBloc(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: MaterialApp(
          title: 'Alpha Taxi',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: routes,
          navigatorObservers: [],
        ),
      ),
    );
  }
}
