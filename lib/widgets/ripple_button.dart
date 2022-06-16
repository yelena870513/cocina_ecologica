import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final Widget child;
  const RippleButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          child: child,
        ),
      ),
    );
  }
}
