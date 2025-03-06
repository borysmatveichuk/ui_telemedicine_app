import 'dart:async';

import 'package:ui_telemedicine_app/data/model/doctor.dart';
import 'package:ui_telemedicine_app/data/model/doctor_specialization_availability.dart';
import 'package:ui_telemedicine_app/data/repositories/repository_result.dart';

abstract interface class DoctorRepository {
  Future<RepositoryResult<List<DoctorSpecializationAvailability>>>
      fetchSpecializationsAvailability();
  Future<RepositoryResult<List<Doctor>>> fetchDoctors();
  FutureOr<RepositoryResult<Doctor>> fetchDoctor(int id);
}
