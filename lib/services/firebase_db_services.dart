import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class FirebaseDBServices {
  var db = FirebaseFirestore.instance;

  Future addCatatan({
    String? judulcatatan,
    String? isiCatatan,
  }) async {
    var box = await Hive.openBox('userBox');
    var uid = box.get('uid');
    var email = box.get('email');
    var catatan = {
      "judul": judulcatatan,
      "isi": isiCatatan,
      "createBy": email,
      "uidUser": uid,
    };

    var hasil = await db.collection('catatan').doc().set(catatan).then((value) {
      print('$judulcatatan berhasil dibuat');
    });
  }

  getCatatan(String uid) async {
    var hasil =
        await db.collection('catatan').where('uidUser', isEqualTo: uid).get();
    return hasil;
  }

  editCatatan({
    String? judulcatatan,
    String? isiCatatan,
    required String uidCatatan,
  }) async {
    var catatan = {
      "judul": judulcatatan,
      "isi": isiCatatan,
    };

    var hasil = await db
        .collection('catatan')
        .doc(uidCatatan)
        .update(catatan)
        .then((value) {
      print('$judulcatatan berhasil update');
    });
  }

  deleteCatatan(uidCatatan) async {
    var hasil = await db.collection('catatan').doc(uidCatatan).delete();
  }
}
