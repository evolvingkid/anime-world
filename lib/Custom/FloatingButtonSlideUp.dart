import 'package:flutter/material.dart';

class FloatingAnimatedSlideUp extends StatefulWidget {
  final Function() onPressed;
  final List<Widget> buttons;
  final String toogleButton;
  final String tooltip;
  final IconData icon;

  FloatingAnimatedSlideUp(
      {this.onPressed,
      this.tooltip,
      this.icon,
      this.buttons,
      this.toogleButton});

  @override
  _FloatingAnimatedSlideUpState createState() =>
      _FloatingAnimatedSlideUpState();
}

class _FloatingAnimatedSlideUpState extends State<FloatingAnimatedSlideUp>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() async {
    if (!isOpened) {
      isOpened = !isOpened;
      _animationController.forward();
    } else {
      await _animationController.reverse();
      isOpened = !isOpened;
    }
  }

  Widget toggle() {
    return Container(
      child: RaisedButton(
        onPressed: animate,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.toogleButton,
              style: Theme.of(context).textTheme.button,
            ),
            AnimatedIcon(
              color: Colors.white,
              icon: AnimatedIcons.menu_close,
              progress: _animateIcon,
            ),
          ],
        ),
      ),
    );
  }

  animButtons() {
    int i = -1;
    final buttons = widget.buttons.map((e) {
      i += 1;
      return Transform(
        transform: Matrix4.translationValues(
          0.0,
          (_translateButton.value * (widget.buttons.length - i) -
              (8 * widget.buttons.length)),
          0.0,
        ),
        child: isOpened
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  e,
                ],
              )
            : Container(),
      );
    }).toList();
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: animButtons(),
        ),
        toggle(),
      ],
    );
  }
}

// children: <Widget>[
// Transform(
//   transform: Matrix4.translationValues(
//     0.0,
//     _translateButton.value * 3.0,
//     0.0,
//   ),
//   child: add(),
// ),
//   Transform(
//     transform: Matrix4.translationValues(
//       0.0,
//       _translateButton.value * 2.0,
//       0.0,
//     ),
//     child: image(),
//   ),
//   Transform(
//     transform: Matrix4.translationValues(
//       0.0,
//       _translateButton.value,
//       0.0,
//     ),
//     child: inbox(),
//   ),
//   toggle(),
// ],
