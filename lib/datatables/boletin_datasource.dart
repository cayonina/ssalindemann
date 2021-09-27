import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class BoletinDataSource extends DataTableSource {
  final List<UserModel> users;
  final BuildContext context;
  final String curso;
  final Notes notes;
  final String uid;
  BoletinDataSource(this.users, this.context, this.curso, this.notes, this.uid);
  @override
  DataRow getRow(int index) {
    final UserModel user = users[index];
    final Notes nota = notes;
    final image = (user.img == null)
        ? Image(
            image: AssetImage('no-image.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: user.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(
          child: image,
        )),
        DataCell(Text(user.apellidos!)),
        DataCell(Text(user.nombres!)),
        DataCell(Text(user.curso!)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.grade_outlined),
                onPressed: () {
                  // // todo navegar a una nueva pantalla con las notas del usuario
                  // NavigationService.replaceTo('/dashboard/notas/${user.id}');
                  NavigationService.replaceTo(
                      '/dashboard/notas/uid/materia/:idNota');
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
