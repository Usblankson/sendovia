import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';

class ProfileServices {

  final StorageService storageService;
  final StoreService storeService;

  ProfileServices(this.storageService, this.storeService);

  // Future<ApiResponse<UpdateCartPayload>> updateProfile(quantity, cartId) async {
  //   final Map<String, int> body = <String, int>{
  //     "quantity": quantity,
  //   };
  //
  //   return si.apiService.putApi<UpdateCartPayload>(
  //     'users/update',
  //     body,
  //     transform: (dynamic res) {
  //       return UpdateCartPayload.fromJson(res);
  //     },
  //   );
  // }
}