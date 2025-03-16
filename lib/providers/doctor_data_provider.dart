import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_telemedicine_app/data/model/doctor.dart';
import 'package:ui_telemedicine_app/data/model/doctor_specialization_availability.dart';
import 'package:ui_telemedicine_app/data/repositories/doctor_repository.dart';
import 'package:ui_telemedicine_app/data/repositories/mock_doctor_repository.dart';
import 'package:ui_telemedicine_app/data/repositories/repository_result.dart';

final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  return MockDoctorRepository();
});

class DoctorsData {
  final List<DoctorSpecializationAvailability> doctorSpecializationAvailability;
  final List<Doctor> doctors;

  DoctorsData({
    required this.doctorSpecializationAvailability,
    required this.doctors,
  });
}

class DoctorsDataNotifier extends AutoDisposeAsyncNotifier<DoctorsData> {
  Future<void> fetchDoctorsData() async {
    state = const AsyncLoading();
    final doctorRepository = ref.watch(doctorRepositoryProvider);

    final specializationsResult =
        await doctorRepository.fetchSpecializationsAvailability();
    final doctorsResult = await doctorRepository.fetchDoctors();

    if (specializationsResult.isLeft()) {
      state = AsyncValue.error(
          specializationsResult.getLeft().toNullable()!.message,
          StackTrace.current);
      return;
    }

    if (doctorsResult.isLeft()) {
      state = AsyncValue.error(
          doctorsResult.getLeft().toNullable()!.message, StackTrace.current);
      return;
    }

    // If both requests succeeded, combine data
    state = AsyncValue.data(DoctorsData(
        doctorSpecializationAvailability:
            specializationsResult.getRight().toNullable()!,
        doctors: doctorsResult.getRight().toNullable()!));
  }

  @override
  FutureOr<DoctorsData> build() async {
    final doctorRepository = ref.watch(doctorRepositoryProvider);

    final results = await Future.wait([
      doctorRepository.fetchSpecializationsAvailability(),
      doctorRepository.fetchDoctors(),
    ]);

    final specializationsResult = results[0] as RepositoryResult<List<DoctorSpecializationAvailability>>;
    final doctorsResult = results[1] as RepositoryResult<List<Doctor>>;

    if (specializationsResult.isLeft()) {
      throw specializationsResult.getLeft().toNullable()!.message;
    }
    if (doctorsResult.isLeft()) {
      throw doctorsResult.getLeft().toNullable()!.message;
    }
    
    return DoctorsData(
      doctorSpecializationAvailability:
          specializationsResult.getRight().toNullable()!,
      doctors: doctorsResult.getRight().toNullable()!,
    );
  }
}

final doctorsDataNotifierProvider = AsyncNotifierProvider.autoDispose<DoctorsDataNotifier, DoctorsData>(DoctorsDataNotifier.new);
