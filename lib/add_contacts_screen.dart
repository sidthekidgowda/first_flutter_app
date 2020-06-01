import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'contact.dart';

class AddContactsScreen extends StatefulWidget {
  @override
  _AddContactsScreenState createState() => _AddContactsScreenState();
}

class _AddContactsScreenState extends State<AddContactsScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String name;
  String age;
  String imageUrl;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      imageUrl = "https://blogg.hioa.no/rescue/wp-content/themes/hioa-blogg-2/assets/images/user.png";
      name = "";
      age = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
            "Add Contacts"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop({
            "contact": Contact(age: age, name: name, imgUrl: imageUrl)
          });
        },
        child: Icon(
          Icons.check
        )
      ),
      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Example: Bob"
            ),
            onChanged: (value) => setState((){
              name = value;
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _ageController,
            decoration: InputDecoration(
                labelText: "Age",
                hintText: "30"
            ),
            onChanged: (value) => setState(() {
              age = value;
            }),
          ),
        ),
        Card(
          elevation: 4.0,
          child: ListTile(
            leading: CircleAvatar(
              child: Image(
                image: CachedNetworkImageProvider(
                  imageUrl
                ),
              ),
            ),
            title: Text(
              "name: $name"
            ),
            subtitle: Text(
              "years old: $age"
            ),
          ),
        )
      ],
    );
  }
}
