import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  final String? userName; // For pre-populated data, if signed in with Google
  MyProfilePage({Key? key, this.userName}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late TextEditingController nameController;
  late TextEditingController field1Controller;
  late TextEditingController field2Controller;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userName ?? '');
    field1Controller = TextEditingController();
    field2Controller = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    field1Controller.dispose();
    field2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: field1Controller,
              decoration: InputDecoration(
                labelText: "Field 1",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: field2Controller,
              decoration: InputDecoration(
                labelText: "Field 2",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Save button press
                print("Save Profile Information");
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
