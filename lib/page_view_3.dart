import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PageView3 extends StatelessWidget {
  const PageView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/page1.gif"),
            width: 300,
            fit: BoxFit.fitWidth,
          ),
          Gap(15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Dive into a seamless experience",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10),
                Text(
                  textAlign: TextAlign.center,
                  "Dive into a seamless experience with instant results and enjoy the magic of AI at your fingertips. Ready to get started?",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
