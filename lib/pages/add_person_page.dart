// {
//   "nombre": "string",
//   "apellido": "string",
//   "cedula": 0,
//   "salarioBase": 0.0,
//   "díasTrabajados": 0,
//   "sábado": 0,
//   "domingo": 0,
//   "sso": 0.0,
//   "faov": 0.0,
//   "inces": 0.0,
//   "cestaAlimenticia": 0.0,
//   "montoAPagar": 0.0
// }

import 'package:flutter/material.dart';
import 'package:prueba/models/person.dart';
import 'package:prueba/pages/index.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController apellidoController = TextEditingController(text: "");
  TextEditingController cedulaController = TextEditingController(text: "");
  TextEditingController salarioBaseController = TextEditingController(text: "");
  TextEditingController diasTrabajadosController =
      TextEditingController(text: "");
  TextEditingController sabadoController = TextEditingController(text: "");
  TextEditingController domingoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: apellidoController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo apellido',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: cedulaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese la nueva cedula',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: salarioBaseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo salario base',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: diasTrabajadosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese los nuevos días trabajados',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: sabadoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese los nuevos días de sábado',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: domingoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese los nuevos días de domingo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Person person = buildPerson();
                await addPeople(person).then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }

  /// Creates a new person with the given data from the form
  Person buildPerson() {
    return Person(
      uid: "",
      nombre: nombreController.text,
      apellido: apellidoController.text,
      cedula: int.parse(cedulaController.text),
      salarioBase: double.parse(salarioBaseController.text),
      diasTrabajados: int.parse(diasTrabajadosController.text),
      sabado: int.parse(sabadoController.text),
      domingo: int.parse(domingoController.text),
      sso: 0.0,
      faov: 0.0,
      inces: 0.0,
      cestaAlimenticia: 0.0,
      montoAPagar: 0.0,
    );
  }
}
