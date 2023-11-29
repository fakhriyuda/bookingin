import 'package:bookingin/colors.dart';
import 'package:bookingin/features/booked/presentation/booked_page.dart';
import 'package:bookingin/features/home/data/home_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarouselSliders extends StatelessWidget {
  const CarouselSliders({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeData> listHomeData = homeData;
    final List<Widget> imageSliders = listHomeData
        .map((item) => Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      bottomSheet(context, item);
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        cacheWidth: 1000,
                      ),
                    ),
                  ),
                ),
                Text(
                  item.roomName,
                  style: TextStyle(
                      color: ColorB.gold,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  item.detailLocation,
                  style: TextStyle(color: ColorB.greySoft),
                ),
              ],
            ))
        .toList();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 9 / 16,
          viewportFraction: 0.8,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }

  Future<dynamic> bottomSheet(context, HomeData homeData) {
    DateTime timeNow = DateTime.now();
    String dateString = DateFormat('dd MMM yyyy').format(timeNow);
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.asset(
                              homeData.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              cacheHeight: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeData.roomName,
                                  style: TextStyle(
                                      color: ColorB.gold,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  homeData.detailLocation,
                                  style: TextStyle(color: ColorB.greySoft),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  dateString,
                                  style: TextStyle(
                                    color: ColorB.greySoft,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8.0),
                      child: Text("Facilities"),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.facilities.length,
                          itemBuilder: (context, index) {
                            return facilityItem(homeData.facilities[index]);
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8.0),
                      child: Text("Availability"),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.hours.length,
                          itemBuilder: (contect, index) {
                            return Card(
                              color: homeData.hours[index].booked
                                  ? ColorB.yellow
                                  : ColorB.greyLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Container(
                                  padding: const EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  child: Text(homeData.hours[index].hour)),
                            );
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookedPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: ColorB.brown,
                          minimumSize: const Size(88, 36),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                        ),
                        child: const Text("Book"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget facilityItem(Facilities facilities) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      facilities.icon,
                      color: ColorB.brown,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: facilities.qty > 1,
                child: Positioned(
                    right: 0,
                    top: 1,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ColorB.brown),
                      child: Text(
                        "${facilities.qty}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
          Text(facilities.name)
        ],
      ),
    );
  }
}
