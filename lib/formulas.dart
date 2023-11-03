// ignore_for_file: avoid_print

double calculateDesirableBodyWeight(int? feet, int? inches) {
  // Perform the necessary calculations here and return the result
  // For example:
  print('Feet: $feet, Inches: $inches');
  double heightInCm = (feet ?? 0) * 30.48 + (inches ?? 0) * 2.54;
  print('Height in cm: $heightInCm');

  double dbw = heightInCm - 100;
  dbw -= 0.1 * (heightInCm - 100);
  print('Desirable Body Weight: $dbw');
  return dbw;
}
