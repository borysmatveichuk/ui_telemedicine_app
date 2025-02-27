import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_telemedicine_app/data/repositories/doctor_repository.dart';
import 'package:ui_telemedicine_app/data/repositories/mock_doctor_repository.dart';

final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  return MockDoctorRepository();
});
