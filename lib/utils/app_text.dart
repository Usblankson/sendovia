import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText(
    this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.height,
    this.onClick,
   {
    Key? key,
  }) : super(key: key);
  String text;
  double size;
  FontWeight fontWeight;
  Color color;
  double wordSpacing;
  double height;
  VoidCallback? onClick;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null 
      ?Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          wordSpacing: wordSpacing,
        ),
      )
      :
      TextButton(
              onPressed: () {
                onClick!.call();
              },
              style: TextButton.styleFrom(
               
                alignment: Alignment.bottomLeft,
              ),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: size,
                  fontWeight: fontWeight,
                  color: color,
                  wordSpacing: wordSpacing,
                ),
              ),
            ),
    );
  }
}
