import 'package:flutter/material.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key key, this.text, this.image}) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/$image.png"),
            Styles.bold(text, color: loaderBlue),
          ],
        ),
      ),
    );
  }
}
