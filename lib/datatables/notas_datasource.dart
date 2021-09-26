import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class NotasDataSource extends DataTableSource {
  final List<Notes> notas;
  final BuildContext context;
  final String uid;
  NotasDataSource(this.notas, this.context, this.uid);

  @override
  DataRow getRow(int index) {
    final Notes nota = notas[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(nota.materia!)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.grade_sharp),
                onPressed: () {
                  // todo navegar a una nueva pantalla con la información del usuario
                  NavigationService.replaceTo(
                      '/dashboard/notas/$uid/${nota.materia}/${nota.id}');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => this.notas.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
