import 'package:healthypet/models/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> services;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.services,
      required this.distance});
}

var doctors = [
  DoctorModel(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      services: [Service.vaccine],
      distance: 2),
  DoctorModel(
      name: "Dr. Angel ",
      image: "Dr. Stone.jpg",
      services: [Service.vaccine],
      distance: 5),
  DoctorModel(
      name: "Dr. Michelle ",
      image: "Dr. Stone.jpg",
      services: [Service.vaccine],
      distance: 10)
];
