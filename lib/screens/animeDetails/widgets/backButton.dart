import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        decoration: decorations(),
        padding: EdgeInsets.all(5),
        child: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white),
      ),
    );
  }

  BoxDecoration decorations() {
    return BoxDecoration(
      color: Colors.black38,
      borderRadius: BorderRadius.circular(10),
    );
  }
}