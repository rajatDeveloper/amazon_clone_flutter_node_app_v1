import 'package:amazon_clone_nodejs/constants/loader.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/single_product.dart';
import 'package:amazon_clone_nodejs/features/admin/services/admin_services.dart';
import 'package:amazon_clone_nodejs/features/order_detail/screen/order_detail_screen.dart';
import 'package:amazon_clone_nodejs/models/order.dart';
import 'package:flutter/material.dart';

class AdminOrderScreen extends StatefulWidget {
  AdminOrderScreen({Key? key}) : super(key: key);

  @override
  State<AdminOrderScreen> createState() => _AdminOrderScreenState();
}

class _AdminOrderScreenState extends State<AdminOrderScreen> {
  List<Order>? orders;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  AdminServices adminServices = AdminServices();
  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : orders!.length == 0
            ? const Center(child: Text("no orders"))
            : GridView.builder(
                itemCount: orders!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final orderData = orders![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        OrderDetailScreen.routeName,
                        arguments: orderData,
                      );
                    },
                    child: SizedBox(
                      height: 140,
                      child: SingleProduct(
                        image: orderData.products[0].images[0],
                      ),
                    ),
                  );
                },
              );
  }
}
