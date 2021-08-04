import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/category.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/models/usuario.dart';
import 'package:ssalindemann/providers/categories_provider.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/modals/category_modal.dart';

class UsersDataSource extends DataTableSource {
  final List<UserModel> users;

  UsersDataSource(this.users);

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

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: image,
      )),
      DataCell(Text(user.apellidos!)),
      DataCell(Text(user.nombres!)),
      DataCell(Text(user.curso!)),
      DataCell(Text(user.celular!)),
      DataCell(IconButton(
        icon: Icon(Icons.edit_outlined),
        onPressed: () {
          // todo navegar a una nueva pantalla con la información del usuario
          NavigationService.replaceTo('/dashboard/users/${user.id}');
        },
      )),
    ]);
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
