import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  late String? imagePath, title, desc;
  late BoxDecoration? pageDecoration;
  late BoxDecoration? imageDecoration;

  SlideTile({this.imagePath, this.title, this.desc, this.pageDecoration,this.imageDecoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: this.pageDecoration!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: this.pageDecoration!,
            child: Image.asset(imagePath ?? "assets/Capture.PNG", errorBuilder:
                (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
              // Appropriate logging or analytics, e.g.
              // myAnalytics.recordError(
              //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
              //   exception,
              //   stackTrace,
              // );
              return Center(child: Text("No Image Found on\n $imagePath"));
            }),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
        ],
      ),
    );
  }
}
