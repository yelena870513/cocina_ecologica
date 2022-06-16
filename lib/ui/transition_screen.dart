import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'navigation.dart';

class TransitionScreen extends StatefulWidget {
  const TransitionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late VideoPlayerController _controller;
  bool startedPlaying = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/splash.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.addListener(() {
      if (startedPlaying && !_controller.value.isPlaying) {
        navigate();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    setState(() {
      startedPlaying = true;
    });
    return Scaffold(
        backgroundColor: Colors.white, body: VideoPlayer(_controller));
  }

  startTimer() {
    var _duration = const Duration(milliseconds: 50);
    return Timer(_duration, animacionSalida);
  }

  navigate() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: const NavigationScreen(),
          );
        },
        transitionDuration: const Duration(milliseconds: 700)));
  }

  animacionSalida() {
    _animationController.forward();
  }
}
