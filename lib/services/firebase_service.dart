import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/person.dart';

FirebaseFirestore baseDeDatos = FirebaseFirestore.instance;

Future<List<Person>> getPeople() async {
  List<Person> people = [];

  CollectionReference collectionReferencePeople =
      baseDeDatos.collection('people');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var doc in queryPeople.docs) {
    final data = doc.data() as Map<String, dynamic>;
    Person person = Person.fromJson(
      doc.id,
      data,
    );
    people.add(person);
  }

  return people;
}

Future<void> addPeople(Person person) async {
  person.calculate();
  await baseDeDatos.collection('people').add(person.toJson());
}

Future<void> updatePeople(String uid, String newName) async {
  await baseDeDatos.collection("people").doc(uid).update({"name": newName});
}

Future<void> deletePeople(String uid) async {
  await baseDeDatos.collection('people').doc(uid).delete();
}
