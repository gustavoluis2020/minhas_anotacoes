import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userId;

  static Future<void> addItem({
    required String title,
    required String description,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc();
    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print('Sem itens'))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print('Sem itens para Atualizar'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userId).collection('items');
    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);
    await documentReference
        .delete()
        .whenComplete(() => print('Sem Itens para deletar'))
        .catchError((e) => print(e));
  }
}
