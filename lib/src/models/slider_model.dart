import 'package:flutter/material.dart';

class SliderModel {
  String? title;
  String? desc;
  String? imageAssetPath;
  BoxDecoration? imageDecoration;
  BoxDecoration? pageDecoration;

  SliderModel(
      {this.title,
      this.desc,
      this.imageAssetPath,
      this.pageDecoration,
      this.imageDecoration});

  static List<SliderModel> getSliders() {
    return [
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG"
        ..pageDecoration = BoxDecoration(color: Colors.red),
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
      SliderModel()
        ..title = "tilte"
        ..desc = "a lot of descrption"
        ..imageAssetPath = "assets/Capture.PNG",
    ];
  }
}
