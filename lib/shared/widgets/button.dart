import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:planetx/shared/models/themes.dart';

class Button extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final double radius;
  final bool enable;
  final Color textColor;
  final Icon icon;
  final String text;
  final Color borderColor;

  const Button(
      {@required this.widget,
      @required this.onPressed,
      this.width,
      this.height,
      this.color,
      this.radius,
      this.enable = true,
      this.textColor,
      this.icon,
      this.text,
      this.borderColor = primaryColor,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.enable == true ? this.onPressed : null,
      child: Container(
        height: this.height,
        width: this.width, // ?? Get.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: this.enable ? this.borderColor : Colors.transparent),
            color: this.enable ? this.color : primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        //   width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                  child: this.widget ??
                      Text(this.text ?? 'Next',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'PT Sans',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: this.textColor ?? white))),
            ),
            this.icon ?? Container() // Icon(Icons.chevron_right, color: white)
          ],
        ),
      ),
    );
  }
}
