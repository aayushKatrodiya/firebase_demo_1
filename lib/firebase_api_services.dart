import 'package:firebase_database/firebase_database.dart';

class FireBaseApi {
  static final DatabaseReference _db = FirebaseDatabase.instance.ref("user");

  static Future<void> addUser({required String userName}) async {
    await _db.set(userName);
  }
}
