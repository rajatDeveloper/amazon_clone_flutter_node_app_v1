import 'package:amazon_clone_nodejs/common/widgets/bottom_navbar.dart';
import 'package:amazon_clone_nodejs/features/admin/screens/add_products.dart';
import 'package:amazon_clone_nodejs/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_nodejs/features/home/screens/category_screen.dart';
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

    case AddProducts.routeName:
      return MaterialPageRoute(builder: (_) => AddProducts());
    case BottomBar.routename:
      return MaterialPageRoute(builder: (_) => BottomBar());
    case CategoryScreen.routename:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryScreen(
                category: category,
              ));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
            body: Center(
          child: Text("Screen does not exist !"),
        )),
      );
  }
}
