import 'package:flutter/material.dart';

// Описание траектории перемещения Hero()

RectTween myHeroTrajectory(Rect begin, Rect end) {
  return CustomRectTween(begin: begin, end: end);
}

class CustomRectTween extends RectTween {
  CustomRectTween({Rect begin, Rect end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    double height = end.top - begin.top;
    double width = end.left - begin.left;

    double animatedX = begin.left + (t * width);
    double animatedY = begin.top + (t * height);

    double animatedW = begin.width + ((end.width - begin.width) * t);
    double animatedH = begin.height + ((end.height - begin.height) * t);

    return Rect.fromLTWH(animatedX, animatedY, animatedW, animatedH);
  }
}
