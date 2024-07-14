import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tincidunt/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addUsers(UserModel userModel) async {
    try {
      final collection = _firebaseFirestore.collection("users");
      final documentId = collection.doc().id;
      final document = collection.doc(documentId);
      return await document.set(userModel.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
