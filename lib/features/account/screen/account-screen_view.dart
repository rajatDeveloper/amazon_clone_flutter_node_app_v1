import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/orders.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/top_btn.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BelowAppBar(),
            const SizedBox(
              height: 10,
            ),
            TopBtns(),
            const SizedBox(
              height: 10,
            ),
            Orders()
          ],
        ),
      ),
    );
  }
}
