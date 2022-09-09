import 'dart:math';

int randomInt(int min, int max) {
  Random rnd = Random();
  int val = min + rnd.nextInt(max - min);
  return val;
}

double randomDouble(double min, double max) {
  Random rnd = Random();
  double val = min + rnd.nextDouble() * (max - min);
  return val;
}
