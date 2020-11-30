import 'package:flutter/material.dart';

class ScoreItem extends StatelessWidget {
  ScoreItem({@required this.value, this.caption});

  final int value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(value.toString(), style: Theme.of(context).textTheme.headline3),
        Text(caption, style: Theme.of(context).textTheme.caption),
      ],
    ));
  }
}
