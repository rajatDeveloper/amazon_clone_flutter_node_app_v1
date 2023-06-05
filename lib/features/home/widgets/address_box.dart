import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 144, 226, 221),
        Color.fromARGB(255, 162, 236, 233),
      ], stops: [
        0.5,
        1.0
      ])),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Deliver to ${user.name} - ${user.address}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 2),
            child: Icon(Icons.arrow_drop_down_outlined),
          )
        ],
      ),
    );
  }
}
