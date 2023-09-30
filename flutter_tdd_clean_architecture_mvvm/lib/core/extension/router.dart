import 'package:flutter/material.dart';

extension RestartPageEffect on Widget {
  Future fadeTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );

  Future fadeTransitionReplace({required BuildContext context}) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );

  Future slideTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );

  Future slideTransitionReplace({required BuildContext context}) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );

  Future scaleTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      );

  Future scaleTransitionReplace({required BuildContext context}) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      );

  Future rotateTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        ),
      );

  Future rotateTransitionReplace({required BuildContext context}) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        ),
      );

  Future sizeTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
        ),
      );

  Future sizeTransitionReplace({required BuildContext context}) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
        ),
      );

  Future fadeScaleTransitionPush({required BuildContext context}) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        ),
      );
}
