import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListViewShinner extends StatelessWidget {
  final double radius;
  final double width;

  ListViewShinner({this.radius = 30, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black38,
        highlightColor: Colors.white30,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: radius),
            const SizedBox(width: 10),
            Column(
              children: [
                Container(width: width, height: 5, child: const SizedBox(), color: Colors.black38,),
                const SizedBox(height: 10),
                Container(width: width, height: 5, child: const SizedBox(), color: Colors.black38,),
                const SizedBox(height: 10),
                Container(width: width, height: 5, child: const SizedBox(), color: Colors.black38,),
              ],
            )
          ],
        ));
  }
}
