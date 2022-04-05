import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../../../core/services/sendgift_service.dart';
import '../../../core/view_model/base_vm.dart';

class ContactViewModel extends BaseViewModel {
  final SendGiftService sendGiftService;
  final BuildContext context;
  final dynamic notifs;
  ContactViewModel({this.sendGiftService, this.context, this.notifs});

  notify() {
    notifyListeners();
  }

  String message = "";
  List<Contact> _contacts;
  List<Contact> _contactsFiltered = [];
  List<Contact> get contacts => _contacts;
  List<Contact> get contactsFiltered => _contactsFiltered;
  TextEditingController searchController = new TextEditingController();
  bool isSearching = false;
  bool _permissionDenied = false;
  bool get permissionDenied => _permissionDenied;

  @override
  FutureOr<void> init() async {
    // TODO: implement init

    _fetchContacts();
  }

  switchIsSearching() {
    if (searchController.text.isNotEmpty) isSearching = true;
    notify();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      _permissionDenied = true;
    } else {
      searchController.addListener(() {
        filterContacts();
      });
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      _contacts = contacts;
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
    _searchcontacts.addAll(contacts);
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
        }, orElse: () => null);

        return phone != null;
      });
    }

    _contactsFiltered = _searchcontacts;
    notify();
  }
}
