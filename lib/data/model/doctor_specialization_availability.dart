import 'package:ui_telemedicine_app/data/model/doctor_specialization.dart';

class DoctorSpecializationAvailability {
  final DoctorSpecialization specialization;
  final int availableDoctors;

  const DoctorSpecializationAvailability({
    required this.specialization,
    required this.availableDoctors,
  });
}
