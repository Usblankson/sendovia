import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';

class SendGiftService {
  SendGiftService({this.storageService, this.storeService});

  StorageService? storageService;

  StoreService? storeService;

  // Future<ApiResponse<NotificationPayload>> getNotification({
  //   String userId,
  // }) async {
  //   Map<String, String> params = {
  //     "UserId": userId,
  //   };

  //   // print("tttttt");
  //   return si.apiService.getApi<NotificationPayload>(
  //     'Notification',
  //     params: params,
  //     transform: (dynamic res) {
  //       return res != null ? NotificationPayload.fromJson(res) : null;
  //     },
  //   );
  // }

}
