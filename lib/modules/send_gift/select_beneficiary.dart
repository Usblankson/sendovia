import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/send_gift/add_message_screen.dart';
import 'package:planetx/modules/send_gift/viewmodel/contacts_vm.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/models/cart_model.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_button.dart';

class FlutterContactsExample extends StatefulWidget {
  List<PayloadFromCart>? cartPayload;

  FlutterContactsExample({Key? key, this.cartPayload}) : super(key: key);

  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ContactViewModel>(
      vmBuilder: (context) => ContactViewModel(
          context: context, sendGiftService: si.sendGiftService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ContactViewModel viewModel) =>
      SafeArea(
          child: Scaffold(
              backgroundColor: white,
              appBar: AppBar(
                title: Styles.bold('Pick a Contact', color: black),
                backgroundColor: white,
                elevation: 1,
              ),
              body: _body(context, viewModel)));

  Widget _body(BuildContext context, ContactViewModel viewModel) {
    if (viewModel.permissionDenied)
      return Center(child: Text('Permission denied'));
    if (viewModel.contacts == null)
      return Center(child: CircularProgressIndicator());
    viewModel.switchIsSearching();
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(Icons.search, color: grey),
                SizedBox(width: 16),
                Text("Search Contacts",
                    style: TextStyle(
                        color: greyishwhite,
                        fontFamily: "Epilogue",
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
                itemCount: viewModel.contacts!.length,
                itemBuilder: (context, i) {
                  Uint8List? image = (viewModel.contacts![i].photo == null)
                      ? null
                      : viewModel.contacts![i].photo!;
                  String num = (viewModel.contacts![i].phones.isNotEmpty)
                      ? (viewModel.contacts![i].phones.first.number)
                      : "--";
                  return ListTile(
                      leading: (viewModel.contacts![i].photo == null)
                          ? const CircleAvatar(
                              child: Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              backgroundColor: purpleGrey,
                            )
                          : CircleAvatar(backgroundImage: MemoryImage(image!)),
                      title: Text(viewModel.contacts![i].displayName),
                      subtitle: Text(num),
                      onTap: () async {
                        final contact = await FlutterContacts.getContact(
                            viewModel.contacts![i].id);

                        showModalBottomSheet(
                          constraints: BoxConstraints.expand(height: 390),
                          isDismissible: true,
                          enableDrag: true,
                          isScrollControlled: true,
                          elevation: 5,
                          barrierColor: Colors.grey.withOpacity(0.5),
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const CircleAvatar(
                                        child: Icon(
                                          Icons.person,
                                          color: primaryColor,
                                        ),
                                        radius: 31.5,
                                        backgroundColor: purpleGrey,
                                      ),
                                      VSpace(16.h),
                                      Column(children: [
                                        Styles.regular(
                                            "${contact!.name.first} ${contact!.name.last}",
                                            fontSize: 10.sp),
                                        Styles.regular(
                                            "${contact!.phones.isNotEmpty ? contact.phones.first.number : '(none)'}",
                                            fontSize: 14.sp),
                                        Styles.regular(
                                            "${contact!.emails.isNotEmpty ? contact.emails.first.address : '(none)'}",
                                            fontSize: 14.sp),
                                      ]),
                                      CustomButton(
                                          title:
                                              "Send gift to ${contact!.name.first}",
                                          isActive: true,
                                          onPress: () async {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    AddMessageScreen(
                                                  cartPayload:
                                                      widget.cartPayload,
                                                  contact: contact,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                        // await Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => ContactPage(fullContact!)));
                      });
                }),
          ),
        ),
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Column(children: [
        Text('First name: ${contact.name.first}'),
        Text('Last name: ${contact.name.last}'),
        Text(
            'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
        Text(
            'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
      ]));
}
