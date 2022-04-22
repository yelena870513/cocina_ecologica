import 'dart:async';
import 'dart:math' as math;
import 'package:cocina_ecologica/ui/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 6,
      ),
    );
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
          animation: _animationController,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imagenes/splash.jpg'),
                    fit: BoxFit.cover)),
          ),
          builder: (BuildContext context, Widget? child) {
            final animation = Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(_animationController);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
  }

  startTimer() {
    var _duration = const Duration(milliseconds: 50);
    return Timer(_duration, _transition);
  }

  navigate() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: const HomeScreen(),
          );
        },
        transitionDuration: const Duration(seconds: 3)));
  }

  _transition() {
    _animationController.forward().whenComplete(navigate);
  }
}
