import 'package:amazon_clone_nodejs/features/account/service/account_service.dart';
import 'package:amazon_clone_nodejs/features/account/widgets/account_btn.dart';
import 'package:flutter/material.dart';

class TopBtns extends StatefulWidget {
  TopBtns({Key? key}) : super(key: key);

  @override
  State<TopBtns> createState() => _TopBtnsState();
}

class _TopBtnsState extends State<TopBtns> {
  final AccountServices accountServices = AccountServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountBtn(text: "Your Orders", onPressed: () {}),
            AccountBtn(text: "Turn Seller", onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountBtn(
                text: "Log Out",
                onPressed: () {
                  accountServices.logOut(context);
                }),
            AccountBtn(text: "Wishlist", onPressed: () {}),
          ],
        )
      ],
    );
  }
}
