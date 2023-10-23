import 'package:dndapp/widgets/navigation/routes/routeTypes.dart';
import 'package:flutter/material.dart';

Route routeTo(final Widget page, RouteType type) {
  switch (type) {
    case RouteType.slideIn:
      return slideIn(page);
  }
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
