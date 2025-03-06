import 'dart:async';

import 'package:ui_telemedicine_app/data/model/doctor.dart';
import 'package:ui_telemedicine_app/data/model/doctor_specialization.dart';
import 'package:ui_telemedicine_app/data/model/doctor_specialization_availability.dart';
import 'package:ui_telemedicine_app/data/repositories/doctor_repository.dart';
import 'package:ui_telemedicine_app/data/repositories/repository_result.dart';
import 'package:ui_telemedicine_app/utils/images.dart';

class MockDoctorRepository implements DoctorRepository {
  @override
  Future<RepositoryResult<List<DoctorSpecializationAvailability>>>
      fetchSpecializationsAvailability() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return RepositoryResult.left(MockData._specializationAvailability);
    } catch (e) {
      return RepositoryResult.right(AppException('Error: ${e.toString()}'));
    }
  }

  @override
  Future<RepositoryResult<List<Doctor>>> fetchDoctors() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      try {
        return RepositoryResult.left(MockData._doctors.values.toList());
      } catch (e) {
        return RepositoryResult.right(AppException('Error: ${e.toString()}'));
      }
    });
  }

  @override
  FutureOr<RepositoryResult<Doctor>> fetchDoctor(int id) async {
    return await Future.delayed(const Duration(seconds: 2), () {
      try {
        final doctor = MockData._doctors[id];
        if (doctor != null) {
          return RepositoryResult.left(doctor);
        } else {
          return RepositoryResult.right(
              AppException('Doctor with id $id not found'));
        }
      } catch (e) {
        return RepositoryResult.right(AppException('Error: ${e.toString()}'));
      }
    });
  }
}

abstract class MockData {
  static const List<DoctorSpecializationAvailability>
      _specializationAvailability = [
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

  static const Map<int, Doctor> _doctors = {
    1: Doctor(
      id: 1,
      firstName: 'Liza',
      lastName: 'Smith',
      specialization: DoctorSpecialization.cardiologist,
      rating: 5.0,
      numberOfReviews: 1500,
      gender: Gender.female,
      photo: DoctorsImages.doctor1,
    ),
    2: Doctor(
      id: 2,
      firstName: 'Emily',
      lastName: 'Johnson',
      specialization: DoctorSpecialization.neurologist,
      rating: 4.8,
      numberOfReviews: 2500,
      gender: Gender.female,
      photo: DoctorsImages.doctor2,
    ),
    3: Doctor(
      id: 3,
      firstName: 'Sophia',
      lastName: 'Brown',
      specialization: DoctorSpecialization.cardiologist,
      rating: 5.0,
      numberOfReviews: 1500,
      gender: Gender.female,
      photo: DoctorsImages.doctor3,
    ),
    4: Doctor(
      id: 4,
      firstName: 'James',
      lastName: 'Davis',
      specialization: DoctorSpecialization.pulmonologist,
      rating: 4.9,
      numberOfReviews: 3500,
      gender: Gender.male,
      photo: DoctorsImages.doctor4,
    ),
    5: Doctor(
      id: 5,
      firstName: 'Alexander',
      lastName: 'Jones',
      specialization: DoctorSpecialization.cardiologist,
      rating: 5.0,
      numberOfReviews: 1800,
      gender: Gender.male,
      photo: DoctorsImages.doctor5,
    ),
    6: Doctor(
      id: 6,
      firstName: 'Daniel',
      lastName: 'Cook',
      specialization: DoctorSpecialization.neurologist,
      rating: 4.8,
      numberOfReviews: 5600,
      gender: Gender.male,
      photo: DoctorsImages.doctor6,
    ),
  };
}
