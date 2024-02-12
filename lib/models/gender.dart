enum Gender { male, female, other }

class GenderSelectionController {
  Gender? selectedGender;

  void selectGender(Gender gender) {
    selectedGender = gender;
  }
}
