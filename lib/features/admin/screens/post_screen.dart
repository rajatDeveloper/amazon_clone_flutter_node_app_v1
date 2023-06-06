import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/single_product.dart';
import 'package:amazon_clone_nodejs/features/admin/screens/add_products.dart';
import 'package:amazon_clone_nodejs/features/admin/services/admin_services.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products = [];
  final AdminServices adminServices = AdminServices();
  void navigateToAddProductScreen() {
    Navigator.pushNamed(context, AddProducts.routeName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context: context);
    setState(() {});
    // print("$products!.length  - length");
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: products!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return Column(
                      children: [
                        SizedBox(
                            height: 140,
                            child: SingleProduct(image: productData.images[0])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                            )),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
                          ],
                        )
                      ],
                    );
                  }),
            ),
          );
  }
}
