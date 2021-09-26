import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/profesor_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class CalificionesDataSource extends DataTableSource {
  final List<Calificacion> calificaciones;
  final BuildContext context;
  final String uid;
  CalificionesDataSource(this.calificaciones, this.context, this.uid);

  @override
  DataRow getRow(int index) {
    final Calificacion calificacion = calificaciones[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(calificacion.materia)),
        DataCell(Text(calificacion.curso)),
        // DataCell(Text(user.materia!)),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.grade_outlined),
                onPressed: () {
                  // todo navegar a una nueva pantalla con la información del usuario
                  NavigationService.replaceTo(
                      '/dashboard/calificaciones/$uid/${calificacion.curso}/${calificacion.materia}/JxvBR91Tx6alR5gX7huE');
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
  int get rowCount => this.calificaciones.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
