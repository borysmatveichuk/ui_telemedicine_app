import 'package:ui_telemedicine_app/data/model/doctor_specialization_availability.dart';

abstract interface class DoctorRepository {
  Future<List<DoctorSpecializationAvailability>> fetchSpecializationsAvailability();
}