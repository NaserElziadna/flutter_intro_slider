import 'package:flutter/material.dart';
import 'package:flutter_intro_slider/flutter_intro_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SimpleIntro(
          mySLides: SliderModel.getSliders(),
          // selectedSlideIndex: 2,
          nextWidget: Icon(
            Icons.forward,
          ),
          skipWidget: Icon(
            Icons.skip_next,
          ),
          activeIndicatorSize: Size(10, 10),
          unActiveIndicatorSize: Size(5, 5),
          animationStyle: Curves.slowMiddle,
        ),
      ),
    );
  }
}
