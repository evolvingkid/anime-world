import 'package:flutter/material.dart';

class ErrorMessageShower extends StatelessWidget {
  final String errorMsg;
  final Function onPressedFunction;
  ErrorMessageShower({@required this.errorMsg, @required this.onPressedFunction});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(errorMsg,style:  Theme.of(context).primaryTextTheme.bodyText1,),
            SizedBox(height: 20),
            RaisedButton(onPressed: onPressedFunction, child: Text('Reload'), textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}