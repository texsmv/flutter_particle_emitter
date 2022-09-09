import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particle_emitter/app/particle_emitter/models.dart';
import 'package:particle_emitter/app/particle_emitter/particle_emitter_painter.dart';
import 'package:particle_emitter/app/utils.dart';

class ParticleEmitter extends StatefulWidget {
  ParticleEmitter({Key? key}) : super(key: key);

  @override
  State<ParticleEmitter> createState() => _ParticleEmitterState();
}

class _ParticleEmitterState extends State<ParticleEmitter>
    with SingleTickerProviderStateMixin {
  Duration animationDur = const Duration(milliseconds: 5);
  int particlePerSecond = 20;
  double maxr = 60;
  double minr = 30;
  late AnimationController animationController;
  bool create = false;
  Offset currentPosition = Offset(0, 0);
  List<Particle> particles = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: animationDur,
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
        animationController.forward();
        if (create) {
          createParticlesAt(currentPosition.dx, currentPosition.dy);
        }
      }
    });

    animationController.forward();

    animationController.addListener(() {
      updateParticles();
      setState(() {});
    });
  }

  void updateParticles() {
    List<Particle> newParticles = [];
    for (var i = 0; i < particles.length; i++) {
      animationController.value;
      particles[i].currLife += 0.006;
      particles[i].position = particles[i].origin +
          (particles[i].destiny - particles[i].origin) * particles[i].currLife;

      if (particles[i].currLife < 1) {
        newParticles.add(particles[i]);
      }
    }
    particles = newParticles;
  }

  void createParticlesAt(double x, double y) {
    late double r;
    Offset origin = Offset(x, y);
    for (var i = 0; i < particlePerSecond; i++) {
      double theta = randomDouble(0, 2 * pi);
      r = randomDouble(minr, maxr);
      Offset displacement = Offset(r * cos(theta), r * sin(theta));
      Offset destiny = origin + displacement;
      particles.add(Particle(
        origin: origin,
        destiny: destiny,
        position: origin,
      ));
    }
    animationController.forward();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Listener(
        onPointerUp: (event) {
          create = false;
        },
        onPointerDown: (event) {
          create = true;
        },
        onPointerMove: (event) {
          if (create) {
            currentPosition =
                Offset(event.localPosition.dx, event.localPosition.dy);
          }
        },
        child: CustomPaint(
          painter: ParticleEmitterPainter(
            particles: particles,
          ),
        ),
      ),
    );
  }
}
