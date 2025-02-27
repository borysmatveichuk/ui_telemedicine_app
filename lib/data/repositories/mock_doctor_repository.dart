import 'package:ui_telemedicine_app/data/model/doctor_specialization_availability.dart';
import 'package:ui_telemedicine_app/data/repositories/doctor_repository.dart';

class MockDoctorRepository implements DoctorRepository {
  @override
  Future<List<DoctorSpecializationAvailability>>
      fetchSpecializationsAvailability() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      DoctorSpecializationAvailability(
        specialization: DoctorSpecialization.pulmonologist,
        availableDoctors: 12,
      ),
      DoctorSpecializationAvailability(
        specialization: DoctorSpecialization.cardiologist,
        availableDoctors: 10,
      ),
      DoctorSpecializationAvailability(
        specialization: DoctorSpecialization.neurologist,
        availableDoctors: 1,
      ),
      // You can add more specializations here.
    ];
  }
}
