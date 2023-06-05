import 'package:amazon_clone_nodejs/features/admin/screens/add_products.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  void navigateToAddProductScreen() {
    Navigator.pushNamed(context, AddProducts.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          tooltip: "Add Product",
          onPressed: () {
            navigateToAddProductScreen();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text("Products"),
      ),
    );
  }
}
