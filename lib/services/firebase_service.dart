import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore base_de_datos = FirebaseFirestore.instance;

Future<List> getpeople() async {
  List people = [];
  CollectionReference collectionReferencePeople =
      base_de_datos.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var doc in queryPeople.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
    people.add(person);
  }
  return people;
}

Future<void> addPeople(String name) async {
  await base_de_datos.collection('people').add({
    "name": name,
  });
}

Future<void> updatePeople(String uid, String Newname) async {
  await base_de_datos.collection("people").doc(uid).update({"name": Newname});
}

Future<void> deletePeople(String uid) async {
  await base_de_datos.collection('people').doc(uid).delete();
}
