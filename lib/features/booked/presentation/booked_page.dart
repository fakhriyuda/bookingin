import 'package:bookingin/colors.dart';
import 'package:flutter/material.dart';

class BookedPage extends StatelessWidget {
  const BookedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Thankyou", style: TextStyle(color: ColorB.gold, fontSize: 32)),
          Text(
            "This page is still development, Please call the Officer at 081281399906",
            style: TextStyle(color: ColorB.greySoft),
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
