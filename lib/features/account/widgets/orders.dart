import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/account/service/account_service.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/single_product.dart';
import 'package:amazon_clone_nodejs/features/order_detail/screen/order_detail_screen.dart';
import 'package:amazon_clone_nodejs/models/order.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  ];

  List<Order>? orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }

  AccountServices accountServices = AccountServices();

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: const Text(
                      "Yours Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: GlobalVariables.selectedNavBarColor),
                    ),
                  )
                ],
              ),
              //display orders
              Container(
                  height: 170,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                    top: 20,
                  ),
                  child: orders?.length == 0
                      ? Text("No orders !")
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: orders?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, OrderDetailScreen.routeName,
                                    arguments: orders![index].id);
                              },
                              child: SingleProduct(
                                image: orders![index].products[0].images[0],
                              ),
                            );
                          },
                        ))
            ],
          );
  }
}
