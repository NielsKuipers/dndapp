import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String title;

  const NavigationBar({super.key, required this.title});

  @override
  Widget build(
    BuildContext context,
  ) {
    return CupertinoNavigationBar(
      leading: const Drawer(child: Text('yow')),
      middle: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return false;
  }
}
