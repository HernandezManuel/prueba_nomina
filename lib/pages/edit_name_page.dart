import 'package:flutter/material.dart';
import 'package:prueba/pages/index.dart';

class editName extends StatefulWidget {
  const editName({super.key});

  @override
  State<editName> createState() => _editNameState();
}

class _editNameState extends State<editName> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    return Scaffold(
      appBar: AppBar(title: Text('Actualizar')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration:
                const InputDecoration(hintText: 'Ingrese el nuevo nombre'),
          ),
          ElevatedButton(
              onPressed: () async {
                await updatePeople(arguments['uid'], nameController.text)
                    .then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'))
        ],
      ),
    );
  }
}
