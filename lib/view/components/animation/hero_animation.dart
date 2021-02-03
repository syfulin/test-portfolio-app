import 'package:flutter/material.dart';

// Описание анимации Hero() во время его перемещения

Widget heroAnimation(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return Material(
    color: Colors.transparent,
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, value) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 1 - animation.value,
              child: flightDirection == HeroFlightDirection.push
                  ? fromHeroContext.widget
                  : toHeroContext.widget,
            ),
            Opacity(
              opacity: animation.value,
              child: flightDirection == HeroFlightDirection.push
                  ? toHeroContext.widget
                  : fromHeroContext.widget,
            ),
          ],
        );
      },
    ),
  );
}
