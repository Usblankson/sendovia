import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/models/cart_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../shared/models/api_model.dart';
import '../../../shared/models/update_cart_payload.dart';
import '../../../shared/utils/color.dart';

class CartViewModel extends BaseViewModel {
  final CartService? cartService;
  final BuildContext? context;
  CartViewModel({this.cartService, this.context});

  notify() {
    notifyListeners();
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneNoCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController msgCtrl = TextEditingController();

  String message = "";
  double total = 0;
  bool cartSelected = false;
  List<String> selectedCartId = [];
  List<PayloadFromCart> userCartInfo = [];
  List<PayloadFromCart> selectedCartInfo = [];

  List<Contact>? _contacts;
  List<Contact>? _contactsFiltered = [];
  List<Contact>? get contacts => _contacts;
  List<Contact>? get contactsFiltered => _contactsFiltered;
  TextEditingController searchController = new TextEditingController();
  bool isSearching = false;
  bool _permissionDenied = false;
  bool get permissionDenied => _permissionDenied;

  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init
    getCart(
      context: context!,
    );
  }

  Future<void> refreshContent() async {
    getCart(
      context: context!,
    );
    changeStatus();
  }

  checkCart(PayloadFromCart id, price) {
    // cartSelected = value;
    if (!selectedCartInfo.contains(id)) {
      selectedCartInfo.add(id);
      total += price!;
    } else {
      selectedCartInfo.remove(id);
      total -= price!;
    }
    notify();
  }

  selectCart(id, price) {
    if (switchAll == true) {
      if (!selectedCartInfo.contains(id)) {
        selectedCartInfo.add(id);
        total += price!;
      }
    } else {
      if (selectedCartInfo.contains(id)) {
        selectedCartInfo.remove(id);
        total -= price!;
      }
    }
    notify();
  }

  deselectCart(id) {
    if (selectedCartId.contains(id)) {
      selectedCartId.remove(id);
    }
    notify();
  }

  bool switchAll = false;
  switchCart() {
    switchAll = !switchAll;

    selectedAll();

    notify();
  }

  removeFromCartID() {
    selectedCartInfo.forEach((element) {
      removeFromCart(context: context, cartId: element.product!.id!);
      // total = 0.0;
    });
    notify();
  }

  selectedAll() {
    userCartInfo.forEach((element) {
      selectCart(element, element.price);
    });

    notify();
  }

  // getTotal() {
  //   userCartInfo.forEach((element) {
  //     total += element.price!;
  //   });
  // }

  Future<void> getCart({BuildContext? context}) async {
    changeStatus();

    final ApiResponse<CartPayload> res = await si.cartService.getCart();

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;
      // print("job range success" + jobRange);
      // print("payload content" + res.payload.payload.toString());

      userCartInfo = res.data!.data!;
      // getTotal();
      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      changeStatus();
      changeStatus();
    }
  }

  Future<void> updateCart(
      {BuildContext? context,
      required int quantity,
      required String productId}) async {
    changeStatus();

    final ApiResponse<UpdateCartPayload> res =
        await si.cartService.updateCart(quantity, productId);

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      refreshContent();
      // changeStatus();
      changeStatus();
    }
  }

  Future<void> removeFromCart(
      {BuildContext? context, required String cartId}) async {
    changeStatus();

    final ApiResponse<UpdateCartPayload> res =
        await si.cartService.removeFromCart(cartId);

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      refreshContent();
      changeStatus();
    }
  }

  // Future<void> addToCart(
  //     {BuildContext? context, required String cartId}) async {
  //   changeStatus();
  //
  //   final ApiResponse<UpdateCartPayload> res =
  //       await si.cartService.removeFromCart(cartId);
  //
  //   if (!res.success) {
  //     isLoading = !res.success;
  //     message = res.message!;
  //
  //     showTopSnackBar(
  //       context!,
  //       CustomSnackBar.error(
  //         message: message,
  //       ),
  //     );
  //     changeStatus();
  //   } else {
  //     message = res.message!;
  //
  //     showTopSnackBar(
  //       context!,
  //       CustomSnackBar.success(
  //         message: message,
  //       ),
  //     );
  //     changeStatus();
  //   }
  // }

  Future fetchContacts(context) async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      _permissionDenied = true;
    } else {
      searchController.addListener(() {
        filterContacts();
      });
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      _contacts = contacts;

      showModalBottomSheet(
        constraints: BoxConstraints.expand(height: 390.h),
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        elevation: 5,
        barrierColor: Colors.grey.withOpacity(0.5),
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    Uint8List? image = contacts.isEmpty
                        ? null
                        : (contacts![i].photo == null)
                            ? null
                            : contacts![i].photo!;
                    String num = contacts.isEmpty
                        ? "--"
                        : (contacts![i].phones.isNotEmpty)
                            ? (contacts![i].phones.first.number)
                            : "--";
                    return ListTile(
                        leading: contacts.isEmpty
                            ? const CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                                backgroundColor: purpleGrey,
                              )
                            : (contacts![i].photo == null)
                                ? const CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      color: primaryColor,
                                    ),
                                    backgroundColor: purpleGrey,
                                  )
                                : CircleAvatar(
                                    backgroundImage: MemoryImage(image!)),
                        title: Text(contacts.isEmpty
                            ? "xyz"
                            : contacts![i].displayName),
                        subtitle: Text(num),
                        onTap: () async {
                          if (contacts.isNotEmpty) {
                            final contact = await FlutterContacts.getContact(
                                contacts![i].id);

                            nameCtrl.text =
                                "xxx ${contact?.name.first} ${contact?.name.last}";
                            phoneNoCtrl.text =
                                "${contact!.phones.isNotEmpty ? contact.phones.first.number : '(none)'}";
                            emailCtrl.text =
                                "${contact!.emails.isNotEmpty ? contact.emails.first.address : '(none)'}";

                            notify();
                          }
                          nameCtrl.text = "xxx ";
                          phoneNoCtrl.text = "xxx1 ";
                          emailCtrl.text = "xxx2 ";

                          Navigator.of(context, rootNavigator: true).pop();
                        });
                  }),
            ),
          );
        },
      );
    }
    notify();
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  filterContacts() {
    List<Contact> _searchcontacts = [];
    _searchcontacts.addAll(contacts!);
    if (searchController.text.isNotEmpty) {
      _searchcontacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.number);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null!);

        return phone != null;
      });
    }

    _contactsFiltered = _searchcontacts;
    notify();
  }
}
