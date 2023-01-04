import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solar_clock/src/utils/cono_painter.dart';

class Helios extends StatefulWidget {
  const Helios({super.key});

  @override
  State<Helios> createState() => _HeliosState();
}

class _HeliosState extends State<Helios> with TickerProviderStateMixin {
  late AnimationController _animationHeliosController;
  late Animation<double> _animationHelios;
  late Animation<double> _animationFadeIn;
  late Animation<double> _animationAir;

  late AnimationController _lightController;
  late Animation<int> _animationLight;

  @override
  void initState() {
    super.initState();
    _animationHeliosController =
        AnimationController(vsync: this, duration: const Duration(seconds: 12));
    _animationHelios = Tween<double>(begin: pi, end: 2 * pi)
        .animate(_animationHeliosController);
    _lightController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationLight = IntTween(begin: 0, end: 3).animate(_lightController);
    _animationAir =
        Tween<double>(begin: 0, end: 1).animate(_animationHeliosController);

    _animationFadeIn =
        Tween<double>(begin: 1, end: 1).animate(_animationHeliosController);

    _animationHeliosController.repeat();
    _lightController.repeat();
  }

  @override
  void dispose() {
    _animationHeliosController.dispose();
    _lightController.dispose();
    super.dispose();
  }

  final random = Random();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: -480,
          child: SizedBox(
            height: 5000,
            width: size.width,
            child: AnimatedBuilder(
              animation: _animationHeliosController,
              builder: (context, state) {
                return Transform.translate(
                  offset: Offset(
                    cos(_animationHelios.value) * (size.width + 100),
                    sin(_animationHelios.value) * (size.width / 2),
                  ),
                  child: Opacity(
                    opacity: _animationFadeIn.value,
                    child: Container(
                      height: 800,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                            Color(0xfff8cbed6),
                            Color(0xfff8cbed6),
                            Colors.transparent
                          ])),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: -300,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: AnimatedBuilder(
              animation: _animationHeliosController,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(
                      cos(_animationHelios.value) * (size.width + 100),
                      sin(_animationHelios.value) * (size.width / 2),
                    ),
                    child: Transform.rotate(
                      angle: 61 * pi / 180,
                      child: CustomPaint(
                          painter:
                              ConoPainter(colorOne: const Color(0xfff8cbed6)),
                          child: Container()),
                    ));
              },
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height,
          child: AnimatedBuilder(
              animation: _animationHeliosController,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(
                      cos(_animationHelios.value) * (size.width + 100) - 50,
                      sin(_animationHelios.value) * (size.width / 2) - 50,
                    ),
                    child: child);
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 150,
                    left: 38,
                    child: Transform.rotate(
                      angle: 174 * pi / 180,
                      child: AnimatedBuilder(
                          animation: _animationLight,
                          builder: (context, child) {
                            String frame = _animationLight.value.toString();
                            return Container(
                              height: 400,
                              width: 7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/light_$frame.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 45,
                    child: Transform.rotate(
                      angle: 186 * pi / 180,
                      child: AnimatedBuilder(
                          animation: _animationLight,
                          builder: (context, child) {
                            String frame = _animationLight.value.toString();
                            return Container(
                              height: 400,
                              width: 7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/light_$frame.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Positioned(
                    bottom: size.height / 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/sun.png',
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Image.asset(
                          'assets/images/helios.png',
                          scale: 19,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
