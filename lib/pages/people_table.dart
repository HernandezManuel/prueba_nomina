// Create a datatable widget with the data from the people list

import 'package:flutter/material.dart';
import 'package:prueba/pages/index.dart';

import '../models/person.dart';

class PeopleDataTable extends StatelessWidget {
  const PeopleDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPeople(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Person> people = snapshot.data ?? [];

        return SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Nombre")),
                DataColumn(label: Text("Apellido")),
                DataColumn(label: Text("Cedula")),
              ],
              rows: people
                  .map(
                    (person) => DataRow(
                      cells: [
                        DataCell(Text(person.nombre)),
                        DataCell(Text(person.apellido)),
                        DataCell(Text(person.cedula.toString())),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
