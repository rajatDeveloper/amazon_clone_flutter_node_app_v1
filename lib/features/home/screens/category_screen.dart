import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/home/service/home_service.dart';
import 'package:amazon_clone_nodejs/features/product_detail/screen/product_detail_screen.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key, required this.category}) : super(key: key);
  final String category;
  static const String routename = '/category';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  HomeServices homeServices = HomeServices();
  List<Product>? productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategoryProducts();
  }

  void getAllCategoryProducts() async {
    productList = await homeServices.fetchAllProductsCategory(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(color: Colors.black),
            )),
      ),
      body: productList == null
          ? const Loader()
          : SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Keep going for ${widget.category}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height: 170,
                    child: GridView.builder(
                        padding: EdgeInsets.only(left: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: productList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisCount: 1,
                            childAspectRatio: 1.4),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductDetailScreen.routeName,
                                  arguments: productList![index]);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 0.5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.network(
                                        productList![index].images[0],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                      left: 0, top: 5, right: 15),
                                  child: Text(
                                    productList![index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ]),
            ),
    );
  }
}
