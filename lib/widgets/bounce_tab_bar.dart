import 'package:cocina_ecologica/constants/colors.dart';
import 'package:flutter/material.dart';

const _movement = 75.0;

class BounceTabBar extends StatefulWidget {
  const BounceTabBar(
      {Key? key,
      this.backgroundColor = AppColors.verdeOscuro,
      required this.items,
      required this.onTabChanged,
      this.initialIndex = 0})
      : super(key: key);

  final Color backgroundColor;
  final List<Widget> items;
  final ValueChanged<int> onTabChanged;
  final int initialIndex;

  @override
  _BounceTabBarState createState() => _BounceTabBarState();
}

class _BounceTabBarState extends State<BounceTabBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animTabBarIn;
  late Animation _animTabBarOut;
  late Animation _animCircleItem;
  late Animation _animElevationIn;
  late Animation _animElevationOut;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animTabBarIn =
        CurveTween(curve: const Interval(0.1, 0.6, curve: Curves.decelerate))
            .animate(_controller);

    _animTabBarOut =
        CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.bounceOut))
            .animate(_controller);

    _animCircleItem = CurveTween(
        curve: const Interval(
      0.0,
      0.5,
    )).animate(_controller);

    _animElevationIn =
        CurveTween(curve: const Interval(0.3, 0.5, curve: Curves.decelerate))
            .animate(_controller);

    _animElevationOut =
        CurveTween(curve: const Interval(0.55, 1.0, curve: Curves.bounceOut))
            .animate(_controller);

    _controller.forward(from: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double currentWidth = width;
    double currentElevation = 0.0;
    return SizedBox(
        height: kBottomNavigationBarHeight,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, snapshot) {
            currentWidth = width -
                (_movement * _animTabBarIn.value) +
                (_movement * _animTabBarOut.value);

            return Container(
              padding: const EdgeInsets.only(top: 0.0),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ))),
              child: Center(
                child: Container(
                  width: currentWidth,
                  decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.zero, topLeft: Radius.zero)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(widget.items.length, (index) {
                        final child = widget.items[index];
                        final Widget innerWidget = CircleAvatar(
                          backgroundColor: widget.backgroundColor,
                          child: child,
                          radius: 30.0,
                        );

                        if (_currentIndex == index) {
                          return CustomPaint(
                            child: Transform.translate(
                              offset: Offset(0.0, currentElevation),
                              child: innerWidget,
                            ),
                            foregroundPainter:
                                _CircleItemPainter(_animCircleItem.value),
                          );
                        } else {
                          return GestureDetector(
                            child: innerWidget,
                            onTap: () {
                              setState(() {
                                widget.onTabChanged(index);
                                _currentIndex = index;
                              });
                              _controller.forward(from: 0.0);
                            },
                          );
                        }
                      })),
                ),
              ),
            );
          },
        ));
  }
}

class _CircleItemPainter extends CustomPainter {
  final double progress;

  _CircleItemPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 20.0 * progress;
    const strokeWidth = 10.0;
    final currentStrokeWidth = strokeWidth * (1 - progress);
    if (progress < 1.0 && progress > 0.00000000000000008) {
      canvas.drawCircle(
          center,
          radius,
          Paint()
            ..color = AppColors.verdeOscuro
            ..style = PaintingStyle.stroke
            ..strokeWidth = currentStrokeWidth);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
