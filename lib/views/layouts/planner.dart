import 'package:flutter/material.dart';

class Flanner extends StatefulWidget {
  const Flanner({Key key}) : super(key: key);

  @override
  _FlannerState createState() => _FlannerState();
}

class _FlannerState extends State<Flanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planner Demo'),
      ),
      
    );
  }
}
