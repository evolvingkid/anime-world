import 'package:flutter/material.dart';

class InfoBanner extends StatefulWidget {
  final String stattics1;
  final String stattics2;
  final String stattics3;
  final String stattics4;
  final String stattics5;

  InfoBanner(
      {this.stattics1,
      this.stattics2,
      this.stattics3,
      this.stattics4,
      this.stattics5});

  @override
  _InfoBannerState createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  double containerHedight = 80;
  bool isExpanded = false;

  _onMoreBtnPressed() async {
    if (containerHedight == 80) {
      setState(() {
        containerHedight = 150;
      });

      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isExpanded = true;
        });
      });
    } else {
      setState(() {
        isExpanded = false;
        containerHedight = 80;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: containerHedight,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                 !isExpanded ?  'For more Info' : 'More Details',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                IconButton(
                    icon: !isExpanded ?  Icon(Icons.arrow_drop_down_circle) : Icon(Icons.arrow_drop_up),
                    onPressed: _onMoreBtnPressed)
              ],
            ),
            !isExpanded
                ? SizedBox()
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Divider(color: Colors.white),
                          SizedBox(height: 10),
                          subContent(widget.stattics1, widget.stattics2),
                          const SizedBox(height: 10),
                          subContent(widget.stattics3, widget.stattics4),
                        ]),
                  )
          ],
        ));
  }

  Row subContent(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text1, style: TextStyle(color: Colors.white)),
        Text(text2, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
