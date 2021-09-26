import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/providers.dart';
import 'package:ssalindemann/services/navigation_services.dart';

class UsersDataSource extends DataTableSource {
  final List<UserModel> users;

  final BuildContext context;
  final String curso;
  UsersDataSource(this.users, this.context, this.curso);
  @override
  DataRow getRow(int index) {
    final UserModel user = users[index];

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
        DataCell(Text(user.celular!)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined),
                onPressed: () {
                  // todo navegar a una nueva pantalla con la información del usuario
                  NavigationService.replaceTo(
                      '/dashboard/cursos/${user.curso}/${user.id}');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outlined,
                  color: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Text('¿Esta seguro de borrarlo?'),
                    content: Text('¿Borrar Definitivamente ${user.nombres}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () async {
                            await Provider.of<UsersProvider>(context,
                                    listen: false)
                                .deleteEstudiante(user.id!);
                            Navigator.of(context).pop();
                          },
                          child: Text('Si, borrar')),
                    ],
                  );
                  showDialog(context: context, builder: (_) => dialog);
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.grade_outlined),
              //   onPressed: () {
              //     // // todo navegar a una nueva pantalla con la información del usuario
              //     NavigationService.replaceTo('/dashboard/notas/${user.id}');
              //     // NavigationService.replaceTo(
              //     //     '/dashboard/notas/${user.id}/${nota.materia}/${nota.id}');
              //   },
              // ),
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
