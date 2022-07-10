import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:planetx/modules-new/utils/colors.dart';

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w600
      ),
    );
  }
}