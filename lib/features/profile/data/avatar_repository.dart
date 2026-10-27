import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../core/firebase/firebase_error_message.dart';

class AvatarRepository {
  AvatarRepository(this._db);

  final FirebaseFirestore _db;

  static const _maxBytes = 700 * 1024;

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _db.collection('avatars').doc(uid);

  Stream<Uint8List?> watch(String uid) {
    return _doc(uid)
        .snapshots()
        .map((snap) => (snap.data()?['photo'] as Blob?)?.bytes);
  }

  Future<void> upload({required String uid, required String filePath}) async {
    final bytes = await FlutterImageCompress.compressWithFile(
      filePath,
      minWidth: 256,
      minHeight: 256,
      quality: 70,
      format: CompressFormat.jpeg,
    );
    if (bytes == null || bytes.lengthInBytes > _maxBytes) {
      throw const ImageTooLargeException();
    }
    await _doc(uid).set({'photo': Blob(bytes)});
  }

  Future<void> delete(String uid) => _doc(uid).delete();
}
