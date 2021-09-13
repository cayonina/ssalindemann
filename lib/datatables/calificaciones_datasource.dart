import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/profesor_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class CalificionesDataSource extends DataTableSource {
  final List<ProfesorModel> users;
  final BuildContext context;
  final String area;
  CalificionesDataSource(this.users, this.context, this.area);

  @override
  DataRow getRow(int index) {
    final ProfesorModel user = users[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user.curso!)),
        // DataCell(Text(user.materia!)),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined),
                onPressed: () {
                  // todo navegar a una nueva pantalla con la información del usuario
                  NavigationService.replaceTo(
                      '/dashboard/cursos/${user.curso}');
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
  int get rowCount => this.users.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
