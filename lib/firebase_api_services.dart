import 'package:firebase_database/firebase_database.dart';

class FireBaseApi {
  static final DatabaseReference _db = FirebaseDatabase.instance.ref("user");

  static Future<void> addUser({required String userName}) async {
    String key = _db.push().key!;
    await _db.child(key).set({
      'key': key,
      'userName': userName,
    });
  }

  static Future<List<Map>> selectData() async {
    Map data =
        await _db.once().then((value) => value.snapshot.value as Map? ?? {});
    List<Map> userData = [];
    data.forEach((key, value) {
      // log("$value");
      userData.add(value);
    });
    // log("$userData");
    return userData;
  }

  static Future updateData({
    required String key,
    required String userName,
  }) async {
    await _db.child(key).set({
      "key": key,
      'userName': userName,
    });
  }
}
