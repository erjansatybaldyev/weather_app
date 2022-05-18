import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';

class Repeat extends StatefulWidget {
  Repeat({Key key}) : super(key: key);

  @override
  State<Repeat> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  String _name = 'Data';

  @override
  void initState() {
    log('initState ==>>');
    getName();
    super.initState();
  }

  Future<void> getName() async {
    try {
      await Future.delayed(Duration(seconds: 5));

      _name = 'Name 5 secunds come on';
    } catch (kata) {
      throw Exception(kata);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _name,
          style: TextStyle(color: Colors.black, fontSize: 40.0),
        ),
      ),
    );
  }
}
