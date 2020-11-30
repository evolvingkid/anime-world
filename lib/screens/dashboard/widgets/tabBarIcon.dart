import 'package:flutter/material.dart';

class TabBarImageIcon extends StatelessWidget {
  const TabBarImageIcon({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      child: Column(
        children: [
          icon,
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}