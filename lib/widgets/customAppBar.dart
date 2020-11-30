import 'package:flutter/material.dart';

AppBar customAppBar({
  BuildContext context,
  String title,
  String subTitle,
  List<Widget> actions,
}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline5),
            Text(subTitle,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
       actions == null ? const SizedBox() : Row(children: actions)
      ],
    ),
  );
}
