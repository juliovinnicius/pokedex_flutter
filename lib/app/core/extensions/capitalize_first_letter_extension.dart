extension CapitalizeFirstLetterExtension on String {
  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + substring(1);
  }
}