import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class CityPage extends StatelessWidget {
  CityPage({Key key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final _width =
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Find By City'.toUpperCase()),
        elevation: 0.0,
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bacground.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              style: const TextStyle(color: Colors.white, fontSize: 22.0),
              decoration: const InputDecoration(
                // fillColor: Colors.transparent,
                // filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                hintText: 'Шаардын атын жаз',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 241, 6, 60)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                _textEditingController;
                FocusManager.instance.primaryFocus
                    ?.unfocus(); // text ochup ketuu
                log('_textEditingController  ==> ${_textEditingController.text}');
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 12.0),
                child: Text(
                  'Аба ырайын изде',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
