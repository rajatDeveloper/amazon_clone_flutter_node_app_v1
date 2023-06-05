import 'dart:ffi';

import 'package:flutter/material.dart';

class AccountBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AccountBtn({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.black12.withOpacity(0.03)),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
