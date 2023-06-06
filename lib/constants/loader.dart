import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(
          color: GlobalVariables.secondaryColor,
        ),
      ),
    );
  }
}
