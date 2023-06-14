import 'package:amazon_clone_nodejs/common/widgets/custom_button.dart';
import 'package:amazon_clone_nodejs/common/widgets/star.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/features/search/screen/search_screen.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  static const routeName = '/product-detail-screen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void navigateToSerachScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
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
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.product.id!), Star(rating: 4)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            CarouselSlider(
                items: widget.product.images.map((i) {
                  return Builder(
                      builder: (BuildContext conntext) => Image.network(
                            i,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ));
                }).toList(),
                options: CarouselOptions(
                    viewportFraction: 1, autoPlay: true, height: 300)),
            Container(
              margin:
                  const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 5),
              color: Colors.black12,
              height: 5,
              width: 389,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Deal of the day -",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text("Rs ${widget.product.price.toString()}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.normal))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 5),
              color: Colors.black12,
              height: 5,
              width: 389,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(text: "Buy Now", onTap: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(
                text: "Add to Cart",
                onTap: () {},
                bgColor: const Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 5),
              color: Colors.black12,
              height: 5,
              width: 389,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Rate the product",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              itemCount: 5,
              initialRating: 2.2,
              allowHalfRating: true,
              itemPadding: EdgeInsets.all(5),
              minRating: 1,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: GlobalVariables.secondaryColor,
              ),
              onRatingUpdate: (val) {},
            )
          ],
        ),
      )),
    );
  }
}
