import 'dart:core';

import 'package:flutter/material.dart';
import 'package:prueba/pages/index.dart';

import '../models/person.dart';
import 'people_table.dart';

class home extends StatefulWidget {
  const home({
    super.key,
  });

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crud"),
      ),
      body: PeopleDataTable(),
      // body: PeopleListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PeopleListView extends StatelessWidget {
  const PeopleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: width * 1.4,
        child: procesoTabla(),
      ),
    );
  }
}

class procesoTabla extends StatefulWidget {
  const procesoTabla({
    super.key,
  });

  @override
  State<procesoTabla> createState() => _procesoTablaState();
}

class _procesoTablaState extends State<procesoTabla> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  Person person = snapshot.data![index];

                  return Dismissible(
                    onDismissed: (direction) async {
                      await deletePeople(person.uid);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  "Esta seguro de que quiere eliminar a ${person.nombre}"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, false);
                                    },
                                    child: const Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, true);
                                    },
                                    child: const Text("Estoy Seguro"))
                              ],
                            );
                          });
                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(person.uid),
                    child: ListTile(
                        title: Text(person.nombre),
                        onTap: (() async {
                          await Navigator.pushNamed(context, '/edit',
                              arguments: {
                                "name": person.nombre,
                                "uid": person.uid,
                              });
                          setState(() {});
                        })),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
