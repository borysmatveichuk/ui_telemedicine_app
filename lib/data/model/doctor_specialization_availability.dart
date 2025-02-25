enum DoctorSpecialization {
  generalPhysician,
  cardiologist,
  dermatologist,
  endocrinologist,
  gastroenterologist,
  gynecologist,
  neurologist,
  oncologist,
  ophthalmologist,
  orthopedist,
  pediatrician,
  psychiatrist,
  pulmonologist,
  radiologist,
  urologist,
}

class DoctorSpecializationAvailability {
  final DoctorSpecialization specialization;
  final int availableDoctors;

  DoctorSpecializationAvailability({
    required this.specialization,
    required this.availableDoctors,
  });
}