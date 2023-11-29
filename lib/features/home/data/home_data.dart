import 'package:flutter/material.dart';

class HomeData {
  String image;
  String roomName;
  String location;
  String detailLocation;
  List<Facilities> facilities;

  List<Hours> hours;

  HomeData({
    required this.image,
    required this.roomName,
    required this.location,
    required this.detailLocation,
    required this.facilities,
    required this.hours,
  });
}

class Facilities {
  IconData icon;
  int qty;
  String name;

  Facilities({required this.icon, required this.name, required this.qty});
}

class Hours {
  String hour;
  bool booked;

  Hours({required this.hour, this.booked = false});
}

List<HomeData> homeData = [
  HomeData(
    image: 'images/meet1.jpg',
    roomName: "Harmonis 1",
    location: "Kantor Pusat Pasar Minggu",
    detailLocation: "1st Floor, Garuda Tower",
    facilities: [
      Facilities(icon: Icons.chair, name: "Seat", qty: 25),
      Facilities(icon: Icons.tv, name: "TV", qty: 1),
      Facilities(icon: Icons.fit_screen_outlined, name: "Projector", qty: 1),
      Facilities(icon: Icons.food_bank_rounded, name: "Lunch/\nDinner", qty: 1),
    ],
    hours: [
      Hours(hour: "8AM", booked: true),
      Hours(hour: "9AM", booked: true),
      Hours(hour: "10AM"),
      Hours(hour: "11AM"),
      Hours(hour: "12AM"),
      Hours(hour: "13PM"),
      Hours(hour: "14PM"),
      Hours(hour: "15PM"),
      Hours(hour: "16PM"),
      Hours(hour: "17PM"),
    ],
  ),
  HomeData(
    image: 'images/meet2.jpg',
    roomName: "Harmonis 2",
    location: "Kantor Pusat Pasar Minggu",
    detailLocation: "1st Floor, Garuda Tower",
    facilities: [
      Facilities(icon: Icons.chair, name: "Seat", qty: 25),
      Facilities(icon: Icons.tv, name: "TV", qty: 1),
      Facilities(icon: Icons.fastfood, name: "Snack", qty: 1),
    ],
    hours: [
      Hours(hour: "8AM", booked: true),
      Hours(hour: "9AM", booked: true),
      Hours(hour: "10AM"),
      Hours(hour: "11AM"),
      Hours(hour: "12AM"),
      Hours(hour: "13PM"),
      Hours(hour: "14PM"),
      Hours(hour: "15PM"),
      Hours(hour: "16PM"),
      Hours(hour: "17PM"),
    ],
  ),
  HomeData(
    image: 'images/meet3.jpg',
    roomName: "Harmonis 3",
    location: "Kantor Pusat Pasar Minggu",
    detailLocation: "1st Floor, Garuda Tower",
    facilities: [
      Facilities(icon: Icons.chair, name: "Seat", qty: 25),
      Facilities(icon: Icons.tv, name: "TV", qty: 1),
      Facilities(icon: Icons.fastfood, name: "Snack", qty: 1),
      Facilities(icon: Icons.fit_screen_outlined, name: "Projector", qty: 1),
      Facilities(icon: Icons.food_bank_rounded, name: "Lunch/\nDinner", qty: 1),
    ],
    hours: [
      Hours(hour: "8AM", booked: true),
      Hours(hour: "9AM", booked: true),
      Hours(hour: "10AM"),
      Hours(hour: "11AM"),
      Hours(hour: "12AM"),
      Hours(hour: "13PM"),
      Hours(hour: "14PM"),
      Hours(hour: "15PM"),
      Hours(hour: "16PM"),
      Hours(hour: "17PM"),
    ],
  ),
  HomeData(
    image: 'images/meet4.jpg',
    roomName: "Harmonis 4",
    location: "Kantor Pusat Pasar Minggu",
    detailLocation: "1st Floor, Garuda Tower",
    facilities: [
      Facilities(icon: Icons.chair, name: "Seat", qty: 25),
      Facilities(icon: Icons.fit_screen_outlined, name: "Projector", qty: 1),
      Facilities(icon: Icons.food_bank_rounded, name: "Lunch/\nDinner", qty: 1),
    ],
    hours: [
      Hours(hour: "8AM", booked: true),
      Hours(hour: "9AM", booked: true),
      Hours(hour: "10AM"),
      Hours(hour: "11AM"),
      Hours(hour: "12AM"),
      Hours(hour: "13PM"),
      Hours(hour: "14PM"),
      Hours(hour: "15PM"),
      Hours(hour: "16PM"),
      Hours(hour: "17PM"),
    ],
  )
];
