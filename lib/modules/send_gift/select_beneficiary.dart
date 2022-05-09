import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:planetx/modules/send_gift/viewmodel/contacts_vm.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/widgets/base_view.dart';

class FlutterContactsExample extends StatefulWidget {
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

  Widget _buildScreen(
          BuildContext context, ContactViewModel viewModel) =>
      SafeArea(
          child: Scaffold(
              appBar: AppBar(title: Text('flutter_contacts_example')),
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
          child: TextField(
            controller: viewModel.searchController,
            decoration: InputDecoration(
                labelText: 'Search',
                border: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Theme.of(context).primaryColor)),
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor)),
          ),
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
                itemCount: viewModel.contacts!.length,
                itemBuilder: (context, i) {
                  Uint8List image = viewModel.contacts![i].photo!;
                  String num = (viewModel.contacts![i].phones.isNotEmpty)
                      ? (viewModel.contacts![i].phones.first.number)
                      : "--";
                  return ListTile(
                      leading: (viewModel.contacts![i].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          : CircleAvatar(backgroundImage: MemoryImage(image)),
                      title: Text(viewModel.contacts![i].displayName),
                      subtitle: Text(num),
                      onTap: () async {
                        final fullContact = await FlutterContacts.getContact(
                            viewModel.contacts![i].id);
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ContactPage(fullContact!)));
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
