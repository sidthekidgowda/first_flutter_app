import 'package:flutter/material.dart';

import 'contact.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts;

  @override
  void initState() {
    // TODO: implement initState
    contacts = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Contacts"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.plus_one
        ),
        onPressed: () async{
          Map map = await Navigator.of(context).pushNamed <Map<String,Contact>>("/add_contacts");
          setState(() {
            this.contacts.add(map["contact"]);
          });
        },
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return Card(
            elevation: 4.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Image(
                  image: CachedNetworkImageProvider(
                      contact.imgUrl
                  ),
                ),
              ),
              title: Text(
                  "name: ${contact.name}"
              ),
              subtitle: Text(
                  "years old: ${contact.age}"
              ),
            ),
          );
        },
      ),
    );
  }
}
