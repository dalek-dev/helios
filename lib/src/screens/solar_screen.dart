import 'package:flutter/material.dart';
import 'package:solar_clock/src/widgets/helios.dart';
import 'package:solar_clock/src/widgets/stars_background.dart';

class SolarScreen extends StatefulWidget {
  const SolarScreen({super.key});

  @override
  State<SolarScreen> createState() => _SolarScreenState();
}

class _SolarScreenState extends State<SolarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff252850),
      body: Stack(
        children: [
          Positioned(
              top: 90,
              left: 10,
              child: Image.asset(
                'assets/images/moon.png',
                scale: 6,
              )),
          Container(
            child: const StarsBackground(),
          ),
          const Helios(),
          Positioned(
              bottom: 90,
              right: 10,
              child: Image.asset(
                'assets/images/greek.png',
                scale: 4,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                child: Image.asset(
                  'assets/images/grass.png',
                ),
              ))
        ],
      ),
    );
  }
}
