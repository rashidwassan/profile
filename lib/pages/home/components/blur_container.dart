import 'package:flutter/material.dart';
import 'dart:ui';

class BlurContainer extends StatelessWidget {
  const BlurContainer({Key key, this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: child,
    );
  }
}
