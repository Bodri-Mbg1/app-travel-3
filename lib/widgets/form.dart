import 'package:flutter/material.dart';

class Form1 extends StatelessWidget {
  const Form1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 400),
      child: SizedBox(
        height: 600,
        child: Container(
          width: 460,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
              ),
              color: Colors.white),
        ),
      ),
    );
  }
}
