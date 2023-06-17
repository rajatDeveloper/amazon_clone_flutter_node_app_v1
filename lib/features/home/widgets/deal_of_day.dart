import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/home/service/home_service.dart';
import 'package:amazon_clone_nodejs/features/product_detail/screen/product_detail_screen.dart';
import 'package:amazon_clone_nodejs/features/search/screen/search_screen.dart';
import 'package:amazon_clone_nodejs/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }

  Product? dealOfDay;
  HomeServices homeServices = HomeServices();
  void fetchDealOfDay() async {
    dealOfDay = await homeServices.getDealOfDay(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return dealOfDay == null
        ? Loader()
        : dealOfDay!.name.isEmpty
            ? SizedBox()
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetailScreen.routeName,
                      arguments: dealOfDay);
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        "Deal of the Day",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      dealOfDay!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Rs ${dealOfDay!.price.toString()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        dealOfDay!.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: dealOfDay!.images
                              .map(
                                (e) => Image.network(
                                  e,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                              .toList()),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See All Deals",
                        style: TextStyle(
                          color: Colors.cyan[800],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}
