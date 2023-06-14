import 'package:amazon_clone_nodejs/common/widgets/star.dart';
import 'package:amazon_clone_nodejs/features/product_detail/screen/product_detail_screen.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeName,
            arguments: product);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  height: 135,
                  width: 135,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      width: 200,
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        width: 200,
                        child: Star(rating: 3)),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      width: 200,
                      child: Text(
                        "Rs ${product.price.toString()}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 200,
                      child: Text(
                        "Eligible for Free Shipping",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      width: 200,
                      child: Text(
                        "in Stock",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
