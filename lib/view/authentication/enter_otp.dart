import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/reset_password.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';
import '../../widgets/countdown.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> with TickerProviderStateMixin {
  int _counter = 0;
  AnimationController? _controller;
  int levelClock = 300;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: appbarShadowColor.withOpacity(0.1),
        toolbarHeight: 70,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 3,
        bottomOpacity: 0.1,
        leading: IconButton(
            icon: Image.asset(
              backBtn,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Nav.back(context);
            }),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const YMargin(24),
              AppText('Enter Code', 22, FontWeight.w500, black, 0, 3.2, null),
              const YMargin(12),
              AppText(
                  'Please enter the 6 digit OTP code sent to kingsleyomin@gmail.com ',
                  16,
                  FontWeight.w400,
                  supportTextColor,
                  0,
                  2.4,
                  null),
              const YMargin(32),
              CustomTextFormField(
                label: 'OTP',
                keyboardType: TextInputType.number,
                maxLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
              ),
              const YMargin(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Code will expire in ', 14, FontWeight.w400,
                      supportTextColor, 0, 0, null),
                  Countdown(
                    animation: StepTween(
                      begin: levelClock, // THIS IS A USER ENTERED NUMBER
                      end: 0,
                    ).animate(_controller!),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Didn’t get the code?', 14, FontWeight.w400,
                      supportTextColor, 0, 0, null),
                  const XMargin(1),
                  InkWell(
                    onTap: () {},
                    child: AppText('Resend Code', 14, FontWeight.w600,
                        primaryColor, 0, 0, () {}),
                  ),
                ],
              ),
              const YMargin(24),
              CustomButton(
                title: 'Continue',
                onPress: () => Nav.forward(context, const ResetPassword()),
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
