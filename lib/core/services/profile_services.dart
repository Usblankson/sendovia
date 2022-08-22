import 'package:flutter/material.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/change_password_model.dart';
import 'package:planetx/shared/models/edit_profile_model.dart';

class ProfileServices {

  final StorageService storageService;
  final StoreService storeService;

  ProfileServices({this.storageService, this.storeService});

  Future<ApiResponse<EditProfileModel>> editProfile({String firstName, String lastName, String phoneNumber}) async {
    debugPrint("change password effect");
    final Map<String, String> body = <String, String>{
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber
    };
    return si.apiService.putApi<EditProfileModel>(
      'users/update',
      body,
      transform: (dynamic res) {
        return EditProfileModel.fromJson(res);
      },
    );
  }

  Future<ApiResponse<ChangePasswordModel>> changePassword({String oldPassword, String newPassword}) async {
    debugPrint("change password effect");
    final Map<String, String> body = <String, String>{
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
    return si.apiService.putApi<ChangePasswordModel>(
      'users/change-password',
      body,
      transform: (dynamic res) {
        return ChangePasswordModel.fromJson(res);
      },
    );
  }
}