import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/cart_model.dart';

import '../../shared/models/api_model.dart';
import '../service_injector/service_injector.dart';

class CartService {
  CartService({this.storageService, this.storeService});

  StorageService? storageService;

  StoreService? storeService;

  Future<ApiResponse<CartPayload>> getCart() async {
    // print("tttttt");
    return si.apiService.getApi<CartPayload>(
      'Cart',
      transform: (dynamic res) {
        return CartPayload.fromJson(res);
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
