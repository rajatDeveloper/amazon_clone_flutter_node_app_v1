import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: RichText(
          text: TextSpan(
        text: "hello ,",
        style: const TextStyle(color: Colors.black, fontSize: 22),
        children: [
          TextSpan(
              text: user.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
