import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ml_project/main.dart';

class StartNowWidget extends StatelessWidget {
  const StartNowWidget({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(
          Color(
            0xff9661A0,
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(
              title: "Cat or Dog",
            ),
          ),
        );
      },
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Start Now"),
          Gap(8),
          Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 15,
          ),
        ],
      ),
    );
  }
}
