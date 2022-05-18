// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';

class testing extends StatefulWidget {
  testing({Key key}) : super(key: key);

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  String _name = 'seeening';

  void initState() {
    log('initstate ====>>');
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

  // asynhrovanya Kutuu ishtoo bashkalar ishtep turuu

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
