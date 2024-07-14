import 'package:tincidunt/models/user_model.dart';
import 'package:tincidunt/services/firestore_service.dart';

class FirestoreRepositories {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> addUsersFromService(UserModel userModel) {
    return _firestoreService.addUsers(userModel);
  }

  Stream<List<UserModel>> getUsersFromService() {
    return _firestoreService.getUsers();
  }
}
