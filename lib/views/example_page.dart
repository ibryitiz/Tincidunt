import 'package:flutter/material.dart';
import 'package:tincidunt/models/user_model.dart';
import 'package:tincidunt/services/firestore_service.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final FirestoreService _firestoreService = FirestoreService();
  UserModel userModel = UserModel(name: "ibrahim");

  void addUser() async {
    await _firestoreService.addUsers(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: addUser, child: const Text("Example")),
      ),
    );
  }
}
