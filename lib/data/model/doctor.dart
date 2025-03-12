import 'package:ui_telemedicine_app/data/model/doctor_specialization.dart';

enum Gender {
  male,
  female,
}

class Doctor {
  final int id;
  final String firstName;
  final String lastName;
  final DoctorSpecialization specialization;
  final double rating;
  final int numberOfReviews;
  final Gender gender;
  final String photo;

  const Doctor( {
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.rating,
    required this.numberOfReviews,
    required this.gender,
    required this.photo,
  });
}
