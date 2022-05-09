import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/services/sendgift_service.dart';
import '../../../core/view_model/base_vm.dart';

class SendGiftViewModel extends BaseViewModel {
  final SendGiftService? sendGiftService;
  final BuildContext? context;
  final dynamic notifs;
  SendGiftViewModel({this.sendGiftService, this.context, this.notifs});

  notify() {
    notifyListeners();
  }

  String message = "";

  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init
  }

  // Future<void> getNotifs({BuildContext context, String userId}) async {
  //   changeStatus();
  //
  //   final ApiResponse<NotificationPayload> res =
  //       await si.notificationService.getNotification(userId: userId);
  //
  //   if (res.hasErrors) {
  //     isLoading = res.hasErrors;
  //     message = res.description;
  //
  //     // showTopSnackBar(
  //     //   context,
  //     //   CustomSnackBar.error(
  //     //     message: message,
  //     //   ),
  //     // );
  //   } else {
  //     message = res.description;
  //
  //     notificationList = res.payload.payload;
  //
  //     if (notifs != null) {
  //       notif.message = notifs["body"];
  //       notif.title = notifs["title"];
  //       notif.createdOn = DateTime.now();
  //       notificationList.add(notif);
  //     }
  //
  //     print("notification payload " + res.payload.payload.toString());
  //
  //     notificationList.sort((b, a) => a.createdOn.compareTo(b.createdOn));
  //     // showTopSnackBar(
  //     //   context,
  //     //   CustomSnackBar.success(
  //     //     message: message,
  //     //   ),
  //     // );
  //   }
  //   changeStatus();
  //   changeStatus();
  // }
}
