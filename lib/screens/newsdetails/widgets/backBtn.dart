import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
