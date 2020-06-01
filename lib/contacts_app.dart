import 'package:flutter/material.dart';

import 'add_contacts_screen.dart';
import 'contacts_screen.dart';

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      initialRoute: "/",
      routes: {
        "/": (context) => ContactsScreen(),
        "/add_contacts": (context) => AddContactsScreen()
      },
    );
  }
}
