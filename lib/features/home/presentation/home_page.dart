import 'package:bookingin/colors.dart';
import 'package:bookingin/features/home/presentation/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: ColorB.yellow, width: 5))),
                child: const Text(
                  "Find The Perfect Room",
                  style: TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold, height: 1),
                )),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: TextStyle(color: ColorB.greySoft),
                            ),
                            Wrap(
                              children: [
                                Icon(Icons.location_on_sharp,
                                    color: ColorB.brown, size: 14),
                                const Text('Kantor Pusat Pasar Minggu')
                              ],
                            )
                          ],
                        ),
                        Card(
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            width: 60,
                            height: 60,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${DateTime.now().day}",
                                      style: TextStyle(
                                          color: ColorB.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24)),
                                  Text(DateFormat("MMM")
                                      .format(DateTime.now()))
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Flexible(child:  CarouselSliders())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
