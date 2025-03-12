import 'package:flutter/widgets.dart';
import 'package:ui_telemedicine_app/utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

typedef DoctorAssetItem = ({String image, String localization});

extension DoctorSpecializationExtension on DoctorSpecialization {
  static final Map<DoctorSpecialization, DoctorAssetItem Function(AppLocalizations)> _assetsMapping = {
    DoctorSpecialization.generalPhysician: (i10n) => (image: '', localization: i10n.generalPhysician),
    DoctorSpecialization.cardiologist: (i10n) => (image: OrgansImages.heart, localization: i10n.cardiologist),
    DoctorSpecialization.dermatologist: (i10n) => (image: '', localization: i10n.dermatologist),
    DoctorSpecialization.endocrinologist: (i10n) => (image: '', localization: i10n.endocrinologist),
    DoctorSpecialization.gastroenterologist: (i10n) => (image: '', localization: i10n.gastroenterologist),
    DoctorSpecialization.gynecologist: (i10n) => (image: '', localization: i10n.gynecologist),
    DoctorSpecialization.neurologist: (i10n) => (image: OrgansImages.brain, localization: i10n.neurologist),
    DoctorSpecialization.oncologist: (i10n) => (image: '', localization: i10n.oncologist),
    DoctorSpecialization.ophthalmologist: (i10n) => (image: '', localization: i10n.ophthalmologist),
    DoctorSpecialization.orthopedist: (i10n) => (image: '', localization: i10n.orthopedist),
    DoctorSpecialization.pediatrician: (i10n) => (image: '', localization: i10n.pediatrician),
    DoctorSpecialization.psychiatrist: (i10n) => (image: '', localization: i10n.psychiatrist),
    DoctorSpecialization.pulmonologist: (i10n) => (image: OrgansImages.lungs, localization: i10n.pulmonologist),
    DoctorSpecialization.radiologist: (i10n) => (image: '', localization: i10n.radiologist),
    DoctorSpecialization.urologist: (i10n) => (image: '', localization: i10n.urologist),
  };

  DoctorAssetItem doctorAssetName(BuildContext context) {
    final i10n = AppLocalizations.of(context)!;
    // Look up the function using the static map.
    final asset = _assetsMapping[this];
    if (asset != null) {
      return asset(i10n);
    }

    // Fallback if not defined.
    return (image: '', localization: '');
  }
}