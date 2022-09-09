import 'package:flutter/material.dart';
import 'package:particle_emitter/app/particle_emitter/particle_emitter.dart';

class BoardView extends StatefulWidget {
  BoardView({Key? key}) : super(key: key);

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ParticleEmitter(),
    );
  }
}
