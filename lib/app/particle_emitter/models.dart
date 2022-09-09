import 'package:flutter/widgets.dart';

class Particle {
  Offset origin;
  Offset destiny;
  Offset position;
  double currLife = 0;
  Particle({
    required this.origin,
    required this.destiny,
    required this.position,
  });

  Color get color => Color.fromRGBO((255 * currLife).toInt(),
      (255 * currLife).toInt(), (120 * (currLife)).toInt(), 1);
}
