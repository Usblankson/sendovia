import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/cart_model.dart';

import '../../shared/models/api_model.dart';
import '../service_injector/service_injector.dart';

class CartService {
  CartService({this.storageService, this.storeService});

  StorageService storageService;

  StoreService storeService;

  Future<ApiResponse<CartPayload>> getHistory(
      {String pageIndex, String jobRange}) async {
    Map<String, String> params = {
      "PageIndex": pageIndex,
      "PageSize": "10",
      "jobRange": jobRange,
    };

    // print("tttttt");
    return si.apiService.getApi<CartPayload>(
      'Cart',
      params: params,
      transform: (dynamic res) {
        return res != null ? CartPayload.fromJson(res) : null;
      },
    );
  }

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
