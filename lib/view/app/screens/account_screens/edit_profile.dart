import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sendovia/utils/app_text.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/navigation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isVisible = false;
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
        title: AppText(
            "Edit Profile", 18, FontWeight.w500, textColor, 0, 3.2, null),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // YMargin(158),
              const YMargin(24),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/images/dp.png',
                        fit: BoxFit.cover,
                        width: 108,
                        height: 108,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Image.asset(
                          "assets/images/camera-icon.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               const YMargin(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'First Name',
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                    ),
                  ),
                  const XMargin(17),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Last Name',
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              const YMargin(24),
              CustomTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              const YMargin(24),
              CustomTextFormField(
                label: 'Phone Number',
                keyboardType: TextInputType.number,
                maxLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              const YMargin(24),
              CustomButton(
                title: 'Save changes',
                onPress: () {},
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
