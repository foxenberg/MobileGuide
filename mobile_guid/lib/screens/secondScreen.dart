import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.lightBlue,
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Маршруты'),
                ),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.lightGreen,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Места'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
