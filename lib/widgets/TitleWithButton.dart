import 'package:animeworld/core/themes/textThemes/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key key,
    this.onTap,
    this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 0),
  }) : super(key: key);
  final Function() onTap;
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          SizedBox(
            height: 25,
            width: 40,
            child: RaisedButton(
              onPressed: onTap,
              child: Text(
                "All",
                style: white14,
              ),
              padding: EdgeInsets.all(0),
            ),
          )
        ],
      ),
    );
  }
}
