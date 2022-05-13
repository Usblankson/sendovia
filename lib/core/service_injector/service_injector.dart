import 'package:planetx/core/services/api_service.dart';
import 'package:planetx/core/services/auth_service.dart';
import 'package:planetx/core/services/cart_service.dart';
import 'package:planetx/core/services/color_service.dart';
import 'package:planetx/core/services/layout_service.dart';
import 'package:planetx/core/services/router_service.dart';
import 'package:planetx/core/services/sendgift_service.dart';
import 'package:planetx/core/services/storage_service.dart';
import 'package:planetx/core/services/store_service.dart';
import 'package:planetx/core/services/user_service.dart';

class Injector {
  StoreService storeService = StoreService();
  StorageService storageService = StorageService();
  LayoutService layoutService = LayoutService();
  RouterService routerService = RouterService();
  SendGiftService sendGiftService = SendGiftService();
  CartService cartService = CartService();
  late ApiService apiService;
  late AuthService authService;
  late ColorService colorService;
  late UserService userService;
  Future<bool> init() async {
    // init storage service
    await storageService.initStorage();

    apiService = ApiService(storeService);
    // color and theme service
    colorService = ColorService(storageService);
    authService = AuthService(
      storageService: storageService,
      storeService: storeService,
    );
    userService = UserService(
      storageService: storageService,
      apiService: apiService,
    );
    sendGiftService = SendGiftService(
      storageService: storageService,
      storeService: storeService,
    );
    cartService = CartService(
      storageService: storageService,
      storeService: storeService,
    );

    return true;
  }
}

Injector si = Injector();
