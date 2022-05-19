import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/auth_payload.dart';
import 'package:planetx/shared/utils/config.dart';

import '../../shared/models/register_payload.dart';

class AuthService {
  AuthService({
    required this.storageService,
    required this.storeService,
  });

  StorageService storageService;
  StoreService storeService;

  // bool _refreshing = false;
  //
  // Future<bool> isLoggedIn() async {
  //   final AuthPayload auth = await getAuthData();
  //   return auth != null && auth.token != null && auth.token!.isNotEmpty;
  // }
  //
  // bool _isExpired(Duration lifespan, int time) {
  //   final DateTime ago = DateTime.now().subtract(lifespan);
  //   final DateTime lastUpdated = DateTime.fromMillisecondsSinceEpoch(time);
  //
  //   return lastUpdated.isBefore(ago);
  // }

  Future<AuthPayload> getAuthData() async {
    final Completer<AuthPayload> completer = Completer<AuthPayload>();

    final String data = si.storageService.getItemSync('auth_data');
    if (data.isEmpty) {
      completer.complete(null);
    } else {
      final AuthPayload auth = AuthPayload.fromJson(json.decode(data));
      completer.complete(auth);
    }

    //   // if token has expired, then refresh before returning new token auth data
    //   const Duration lifespan = Duration(minutes: 55);
    //   final bool tokenExpired = _isExpired(lifespan, auth.updatedAt);
    //
    //   // @Todo: Refresh token expiry should be properly tested
    //   if (tokenExpired) {
    //     // check refresh token expiry
    //     const Duration refreshDuration = Duration(hours: 23);
    //     final bool refreshExpired =
    //         _isExpired(refreshDuration, auth.refreshedAt);
    //
    //     if (refreshExpired) {
    //       // refresh token has expired, hence log user out so they can login again
    //       await signOut();
    //
    //       Future<void>.delayed(const Duration(milliseconds: 700)).then((_) {
    //         si.routerService.clearAndPush('/auth/login');
    //         si.layoutService.updateLayout(LayoutConfig());
    //       });
    //
    //       completer.complete(null);
    //     } else {
    //       // renew token here with refresh token
    //       await _renewAuthToken(auth);
    //
    //       return getAuthData();
    //     }
    //   } else {
    //     completer.complete(auth);
    //   }
    // }

    return completer.future;
  }

  // Future<AuthPayload?> _renewAuthToken(AuthPayload auth) async {
  //   if (_refreshing) {
  //     while (true) {
  //       await Future<int>.delayed(const Duration(milliseconds: 500));
  //
  //       if (!_refreshing) {
  //         break;
  //       }
  //     }
  //
  //     return auth;
  //   } else {
  //     _refreshing = true;
  //
  //     final Map<String, String> headers = <String, String>{
  //       HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
  //       HttpHeaders.authorizationHeader: 'Bearer ${auth.refreshToken}',
  //     };
  //
  //     final ApiResponse<AuthPayload> newAuth =
  //         await si.apiService.postApi<AuthPayload>(
  //       'users/refresh-token',
  //       <dynamic, dynamic>{},
  //       customHeaders: headers,
  //       transform: (dynamic res) {
  //         return AuthPayload.fromJson(res);
  //       },
  //     );
  //
  //     if (!newAuth.success) {
  //       await signOut();
  //       await si.storageService.removeItem('auth_data');
  //     } else {
  //       await si.storageService
  //           .setItem('auth_data', json.encode(newAuth.data!.toJson()));
  //     }
  //
  //     _refreshing = false;
  //
  //     return newAuth.data;
  //   }
  // }

  Future<void> signOut() async {
    AppConfig.profilePictureTimestamp = DateTime.now().millisecondsSinceEpoch;

    si.apiService!.postApi<dynamic>(
      'users/logout',
      <String, dynamic>{},
    );

    await Future<void>.delayed(const Duration(milliseconds: 500));
    await si.storageService.removeItem('auth_data');
    storeService.reset();
  }

  Future<ApiResponse<AuthPayload>> login(String? email, String? token) {
    final Map<String, String?> body = <String, String?>{
      'email': email,
      'token': token,
    };

    AppConfig.profilePictureTimestamp = DateTime.now().millisecondsSinceEpoch;
    return si.apiService!.postApiNoHeader<AuthPayload>(
      'auth/login',
      body,
      transform: (dynamic res) {
        return AuthPayload.fromJson(res);
      },
    );
  }

  Future<ApiResponse<RegisterPayload>> signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    final Map<String?, String?> body = <String?, String?>{
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };

    AppConfig.profilePictureTimestamp = DateTime.now().millisecondsSinceEpoch;
    return si.apiService!.postApiNoHeader<RegisterPayload>(
      'auth/register',
      body,
      transform: (dynamic res) {
        debugPrint("auth ress $res");
        return RegisterPayload.fromJson(res);
      },
    );
  }

  Future<ApiResponse<RegisterPayload>> getToken({
    String? email,
  }) {
    final Map<String?, String?> body = <String?, String?>{
      "email": email!.trim(),
    };

    AppConfig.profilePictureTimestamp = DateTime.now().millisecondsSinceEpoch;
    return si.apiService!.postApiNoHeader<RegisterPayload>(
      'auth/login-token',
      body,
      transform: (dynamic res) {
        debugPrint("auth ress $res");
        return RegisterPayload.fromJson(res);
      },
    );
  }
}
