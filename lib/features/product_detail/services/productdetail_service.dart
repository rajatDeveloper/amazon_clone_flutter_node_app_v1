import 'dart:convert';

import 'package:amazon_clone_nodejs/constants/error_handling.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/utils.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:amazon_clone_nodejs/models/user.dart';
import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailService {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProovider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse(
          "$uri/product/rate-product",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProovider.user.token,
        },
        body: jsonEncode({'id': product.id, 'rating': rating}),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product rated successfully !");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //add to cart function
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProovider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse(
          "$uri/user/add-to-cart",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProovider.user.token,
        },
        body: jsonEncode({'id': product.id}),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User user =
                userProovider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            userProovider.setUserFromModel(user);
            // showSnackBar(context, "Product added successfully to cart !");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
