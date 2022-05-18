import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/cart_model.dart';

import '../../shared/models/api_model.dart';
import '../../shared/models/update_cart_payload.dart';
import '../service_injector/service_injector.dart';

class CartService {
  CartService({this.storageService, this.storeService});

  StorageService? storageService;

  StoreService? storeService;

  Future<ApiResponse<CartPayload>> getCart() async {
    // print("tttttt");
    return si.apiService!.getApi<CartPayload>(
      'cart',
      transform: (dynamic res) {
        return CartPayload.fromJson(res);
      },
    );
  }

  Future<ApiResponse<UpdateCartPayload>> updateCart(quantity, cartId) async {
    final Map<String, String> body = <String, String>{
      "quantity": quantity,
    };

    return si.apiService.putApi<UpdateCartPayload>(
      'cart/$cartId/quantity',
      body,
      transform: (dynamic res) {
        return UpdateCartPayload.fromJson(res);
      },
    );
  }

  Future<ApiResponse<UpdateCartPayload>> removeFromCart(cartId) async {
    return si.apiService.deleteApi<UpdateCartPayload>(
      'cart/$cartId/remove-product',
      transform: (dynamic res) {
        return UpdateCartPayload.fromJson(res);
      },
    );
  }

  Future<ApiResponse<UpdateCartPayload>> addToCart(productId, quantity) async {
    final Map<String, String> body = <String, String>{
      "productId": productId,
      "quantity": quantity,
    };

    return si.apiService.postApiAdd<UpdateCartPayload>(
      'cart',
      body,
      transform: (dynamic res) {
        return UpdateCartPayload.fromJson(res);
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
