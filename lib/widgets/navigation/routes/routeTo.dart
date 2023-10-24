import 'package:dndapp/widgets/navigation/routes/transitionType.dart';
import 'package:flutter/material.dart';

void routeTo(final Widget page, TransitionType type, BuildContext context) {
  Route route;

  switch (type) {
    case TransitionType.slideIn:
      route = slideIn(page);
  }

  Navigator.of(context).push(route);
}

Route slideIn(final Widget page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
