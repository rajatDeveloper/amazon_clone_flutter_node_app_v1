import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/home/widgets/address_box.dart';
import 'package:amazon_clone_nodejs/features/search/service/search_service.dart';
import 'package:amazon_clone_nodejs/features/search/widgets/searchedProductCard.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  SearchScreen({Key? key, required this.searchQueary}) : super(key: key);
  final String searchQueary;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  void navigateToSerachScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchedProducts();
  }

  SearchServices searchServices = SearchServices();

  void getSearchedProducts() async {
    products = await searchServices.getSearchedProducts(
      context: context,
      searchQuery: widget.searchQueary,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: 42,
                  margin: EdgeInsets.only(left: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSerachScreen,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        hintText: "Search for products..",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: products == null
            ? Loader()
            : Column(
                children: [
                  AddressBox(),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        return SearchProductCard(product: products![index]);
                        
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
