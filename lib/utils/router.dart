import 'package:amazon_clone_nodejs/common/widgets/bottom_navbar.dart';
import 'package:amazon_clone_nodejs/features/address/screen/adress_screen.dart';
import 'package:amazon_clone_nodejs/features/admin/screens/add_products.dart';
import 'package:amazon_clone_nodejs/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_nodejs/features/home/screens/category_screen.dart';
import 'package:amazon_clone_nodejs/features/home/screens/home_screen.dart';
import 'package:amazon_clone_nodejs/features/order_detail/screen/order_detail_screen.dart';
import 'package:amazon_clone_nodejs/features/product_detail/screen/product_detail_screen.dart';
import 'package:amazon_clone_nodejs/features/search/screen/search_screen.dart';
import 'package:amazon_clone_nodejs/models/order.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
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
    case SearchScreen.routeName:
      var searchQueary = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => SearchScreen(
                searchQueary: searchQueary,
              ));
    case ProductDetailScreen.routeName:
      Product product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
                product: product,
              ));
    case CategoryScreen.routename:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryScreen(
                category: category,
              ));
    case AddressScreen.routeName:
      var data = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => AddressScreen(
                totalAmount: data,
              ));
    case OrderDetailScreen.routeName:
      var data = routeSettings.arguments as Order;
      return MaterialPageRoute(
          builder: (_) => OrderDetailScreen(
                order: data,
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
