import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:particle_emitter/app/particle_emitter/models.dart';

class ParticleEmitterPainter extends CustomPainter {
  final List<Particle> particles;
  ParticleEmitterPainter({required this.particles});
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < particles.length; i++) {
      canvas.drawCircle(
          particles[i].position, 3, Paint()..color = particles[i].color);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
