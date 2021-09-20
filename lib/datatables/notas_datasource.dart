import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class NotasDataSource extends DataTableSource {
  final List<Notes> notas;
  final BuildContext context;
  final String area;
  NotasDataSource(this.notas, this.context, this.area);

  @override
  DataRow getRow(int index) {
    final Notes nota = notas[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(nota.materia)),

        // DataCell(
        //   Row(
        //     children: [
        //       IconButton(
        //         icon: Icon(Icons.edit_outlined),
        //         onPressed: () {
        //           // todo navegar a una nueva pantalla con la información del usuario
        //           NavigationService.replaceTo(
        //               '/dashboard/profesor/${user.area}/${user.id}');
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(
        //           Icons.delete_outlined,
        //           color: Colors.red.withOpacity(0.8),
        //         ),
        //         onPressed: () {
        //           final dialog = AlertDialog(
        //             title: Text('¿Esta seguro de borrarlo?'),
        //             content: Text('¿Borrar Definitivamente ${user.nombres}?'),
        //             actions: [
        //               TextButton(
        //                   onPressed: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: Text('No')),
        //               TextButton(
        //                   onPressed: () async {
        //                     await Provider.of<ProfesorProvider>(context,
        //                             listen: false)
        //                         .deleteProfesor(user.id!);
        //                     Navigator.of(context).pop();
        //                   },
        //                   child: Text('Si, borrar')),
        //             ],
        //           );
        //           showDialog(context: context, builder: (_) => dialog);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
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
