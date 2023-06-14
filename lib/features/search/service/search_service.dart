import 'dart:convert';

import 'package:amazon_clone_nodejs/constants/error_handling.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/utils.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchServices {

    Future<List<Product>> getSearchedProducts({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProovider = Provider.of<UserProvider>(context, listen: false);

    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/product/get-searched-products/$searchQuery"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProovider.user.token,
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

}