import 'dart:async';
import 'package:flutter/material.dart';

// Описание плавно появляющихся объектов

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delayedAnimation; // Задержка анимации
  final double aniOffsetX;
  final double aniOffsetY;
  final int aniDuration; // Продолжительность анимации

  const DelayedAnimation(
      {Key key,
      this.delayedAnimation,
      this.aniOffsetX,
      this.aniOffsetY,
      this.aniDuration,
      this.child})
      : super(key: key);

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with TickerProviderStateMixin {
  // Контроллер анимации
  AnimationController _controller;
  // Объект анимации
  Animation<Offset> _animationOffset;
  // Флаг, что бы пофиксить баг:
  // "AnimationController.forward() called after AnimationController.dispose()\nAnimationController methods should not be used after calling dispose."
  bool wasDispose = false; // ! _

  @override
  void initState() {
    super.initState(); // ? или в начале метода вызывать?
    // Инициализация контроллера анимации
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.aniDuration));

    // Кривая анимации
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);

    // Крайние значения анимации
    _animationOffset = Tween<Offset>(
      begin: Offset(widget.aniOffsetX, widget.aniOffsetY),
      end: Offset.zero,
    ).animate(curve);

    // Проверка
    if (widget.delayedAnimation == null) {
      // Проверка на wasDispose // ! _
      if (!wasDispose) {
        _controller.forward();
      }
    } else {
      Timer(Duration(milliseconds: widget.delayedAnimation), () {
        // Проверка на wasDispose // ! _
        if (!wasDispose) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    wasDispose = true; // ! _
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }
}
