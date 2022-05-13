// ignore_for_file: unused_import

import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/shared/models/allProducts_payload.dart';
import 'package:planetx/shared/models/cart_model.dart';

import '../../shared/models/api_model.dart';
import '../service_injector/service_injector.dart';

class ProductService {
  ProductService({this.storageService, this.storeService});

  StorageService? storageService;

  StoreService? storeService;

  Future<ApiResponse<AllProductsPayload>> getAllProducts() async {
    // print("tttttt");
    return si.apiService!.getApi<AllProductsPayload>(
      'products',
      transform: (dynamic res) {
        return AllProductsPayload.fromJson(res);
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
