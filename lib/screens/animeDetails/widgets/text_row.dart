import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  const TextRow({@required this.title, this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        Text(value),
      ],
    );
  }
}
