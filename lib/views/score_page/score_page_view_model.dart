import 'package:flutter/material.dart';
import 'package:tincidunt/models/user_model.dart';
import 'package:tincidunt/repositories/firestore_repositories.dart';

class ScorePageViewModel with ChangeNotifier {
  ScorePageViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUserList();
    });
  }

  final FirestoreRepositories _firestoreRepositories = FirestoreRepositories();

  Stream<List<UserModel>> getUserList() {
    try {
      return _firestoreRepositories.getUsersFromService();
    } catch (e) {
      throw Stream.error(e);
    }
  }
}
