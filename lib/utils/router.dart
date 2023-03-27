import 'package:amazon_clone_nodejs/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_nodejs/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> genrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => AuthScreen(),
      );

    case HomeScreen.routename:
      return MaterialPageRoute(
        builder: (_) => HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
            body: Center(
          child: Text("Screen does not exist !"),
        )),
      );
  }
}
