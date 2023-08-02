import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget{
  const GlobalAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          FontAwesomeIcons.trainSubway,
          color: Colors.red,
          size: 30,
        ),
        Text(
          'BookMyTrain',
          style: Theme.of(context).textTheme.titleLarge,
        )
      ]),
    );
  }

  @override
 Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}