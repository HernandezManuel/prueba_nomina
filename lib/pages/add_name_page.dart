import 'package:flutter/material.dart';
import 'package:prueba/pages/index.dart';

class addName extends StatefulWidget {
  const addName({super.key});

  @override
  State<addName> createState() => _addNameState();
}

class _addNameState extends State<addName> {
  TextEditingController nameController = TextEditingController(text: "");
  //TextEditingController apellidoController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration:
                const InputDecoration(hintText: 'Ingrese el nuevo nombre'),
          ),
          /*  TextField(
            controller: apellidoController,
            decoration:
                const InputDecoration(hintText: 'Ingrese el nuevo apellido'),
          ), */
          ElevatedButton(
              onPressed: () async {
                await addPeople(nameController.text).then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'))
        ],
      ),
    );
  }
}
