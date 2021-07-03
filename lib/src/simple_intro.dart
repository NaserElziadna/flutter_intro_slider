import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_intro_slider/src/widgets/slider_tile.dart';

import 'models/slider_model.dart';

class SimpleIntro extends StatefulWidget {
  List<SliderModel>? mySLides = [];
  void Function()? onTap;
  Color? activeColor;
  Color? unactiveColor;
  Widget? nextWidget;
  Widget? skipWidget;
  Widget? getStartedNowText;
  int? selectedSlideIndex;
  Size? activeIndicatorSize;
  Size? unActiveIndicatorSize;
  Curve? animationStyle;

  SimpleIntro({
    Key? key,
    this.mySLides,
    this.onTap,
    this.activeColor,
    this.unactiveColor,
    this.nextWidget,
    this.skipWidget,
    this.getStartedNowText,
    this.selectedSlideIndex,
    this.activeIndicatorSize,
    this.unActiveIndicatorSize,
    this.animationStyle,
  }) : assert(mySLides!.length <= 10);

  @override
  _SimpleIntroState createState() => _SimpleIntroState();
}

class _SimpleIntroState extends State<SimpleIntro> {
  int? slideIndex;
  PageController? controller;

  Widget _buildPageIndicator(bool isCurrentPage, {index}) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        height: isCurrentPage
            ? widget.activeIndicatorSize?.height ?? 10.0
            : widget.unActiveIndicatorSize?.height ?? 6.0,
        width: isCurrentPage
            ? widget.activeIndicatorSize?.width ?? 10.0
            : widget.unActiveIndicatorSize?.width ?? 6.0,
        decoration: BoxDecoration(
          color: isCurrentPage
              ? (widget.activeColor ?? Colors.grey)
              : (widget.unactiveColor ?? Colors.grey[300]),
          borderRadius: BorderRadius.circular(12),
          // boxShadow:  [
          //   isCurrentPage
          //       ? BoxShadow(
          //     color: Color(0XFF2FB7B2).withOpacity(0.72),
          //     blurRadius: 4.0,
          //     spreadRadius: 1.0,
          //     offset: Offset(
          //       0.0,
          //       0.0,
          //     ),
          //   )
          //       : BoxShadow(
          //     color: Colors.transparent,
          //   )
          // ],
        ),
      ),
      onTap: () {
        controller!.animateToPage(index ?? 0,
            duration: Duration(milliseconds: 400),
            curve: widget.animationStyle ?? Curves.linear);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // widget.mySLides ?? [];
    controller = new PageController();
    slideIndex = widget.selectedSlideIndex ?? 0;
    controller!.initialPage != slideIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: widget.mySLides!.map((pageData) {
              return SlideTile(
                imagePath: pageData.imageAssetPath,
                title: pageData.title,
                desc: pageData.desc,
                pageDecoration: pageData.pageDecoration ?? BoxDecoration(),
                imageDecoration: pageData.imageDecoration ?? BoxDecoration(),
              );
            }).toList(),
          ),
        ),
        bottomSheet: slideIndex != widget.mySLides!.length - 1
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Tooltip(
                      message: "Skip Button",
                      child: TextButton(
                        onPressed: () {
                          controller!.animateToPage(widget.mySLides!.length - 1,
                              duration: Duration(milliseconds: 400),
                              curve: widget.animationStyle ?? Curves.linear);
                        },
                        // splashColor: Colors.blue[50],
                        child: widget.skipWidget ??
                            Text(
                              "SKIP",
                              style: TextStyle(
                                  color: Color(0xFF0074E4),
                                  fontWeight: FontWeight.w600),
                            ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < widget.mySLides!.length; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true, index: i)
                                : _buildPageIndicator(false, index: i),
                        ],
                      ),
                    ),
                    Tooltip(
                      message: "Next Button",
                      child: TextButton(
                        onPressed: () {
                          print("this is slideIndex: $slideIndex");
                          controller!.animateToPage(slideIndex! + 1,
                              duration: Duration(milliseconds: 500),
                              curve: widget.animationStyle ?? Curves.easeOut);
                        },
                        // splashColor: Colors.blue[50],
                        child: widget.nextWidget ??
                            Text(
                              "NEXT",
                              style: TextStyle(
                                  color: Color(0xFF0074E4),
                                  fontWeight: FontWeight.w600),
                            ),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: widget.onTap ?? () => print("Clicked"),
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: widget.getStartedNowText ??
                      Text(
                        "GET STARTED NOW",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                ),
              ),
      ),
    );
  }
}
