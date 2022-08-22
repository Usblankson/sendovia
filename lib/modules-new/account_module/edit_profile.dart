import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/account_module/viewModel/ProfileViewModel.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/space.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
        builder: (context, editProfileVM, _) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            shadowColor: appbarShadowColor.withOpacity(0.1),
            toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
            toolbarOpacity: 0.5,
            backgroundColor: white,
            elevation: 1,
            bottomOpacity: 0.1,
            leading: IconButton(
                icon: Image.asset(
                  backBtn,
                  width: 24.w,
                  height: 24.h,
                ),
                onPressed: () {
                  Nav.back(context);
                }),
            title: AppText(
                "Edit Profile", 18.sp, FontWeight.w600, textColorDark, 0, 0, null),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // VSpace(158),
                  VSpace(24.h),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.r),
                          child: Image.asset(
                            dp,
                            fit: BoxFit.cover,
                            width: 108.w,
                            height: 108.h,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Image.asset(
                              "assets/images/camera-icon.png",
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VSpace(32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: editProfileVM.firstNameController,
                          onSaved: ()=> editProfileVM.notify(),
                          label: 'First Name',
                          hintText: 'John',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      HSpace(17.h),
                      Expanded(
                        child: CustomTextFormField(
                          controller: editProfileVM.lastNameController,
                          onSaved: ()=> editProfileVM.notify(),
                          label: 'Last Name',
                          hintText: 'Doe',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  // VSpace(24.h),
                  // CustomTextFormField(
                  //   label: 'Email Address',
                  //   keyboardType: TextInputType.emailAddress,
                  //   maxLines: 1,
                  // ),
                  VSpace(24.h),
                  CustomTextFormField(
                    controller: editProfileVM.phoneNumberController,
                    onSaved: ()=> editProfileVM.notify(),
                    label: 'Phone Number',
                    hintText: "e.g 09087654321",
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                  VSpace(24.h),
                  CustomButton(
                    title: 'Save changes',
                    onPress: editProfileVM.editProfileButtonIsEnabled()
                      ? () async {
                      bool isDone = await editProfileVM.editProfile(context);
                    }
                        : () {},
                    isActive: editProfileVM.editProfileButtonIsEnabled(),
                    isLoading: editProfileVM.viewState == ViewState.busy,
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
    );
  }
}
