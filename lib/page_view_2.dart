import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PageView2 extends StatelessWidget {
  const PageView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/page2_1.gif"),
            width: 300,
            fit: BoxFit.fitWidth,
          ),
          Gap(15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Using Url of image",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10),
                  Text(
                    textAlign: TextAlign.center,
                    "Simply enter the URL of an image, and let our intelligent system identify whether it's a playful cat or a loyal dog",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
