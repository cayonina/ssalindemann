import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/users_datasource.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDatSource = new UsersDataSource(usersProvider.users);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Estudiantes',
            style: CustomLabels.h1,
          ),
          Text(
            'Primero A',
            style: CustomLabels.h2,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            // actions: [
            //   CustomIconButton(
            //       onPressed: () {},
            //       text: 'Crear nueva Categoria',
            //       icon: Icons.add_outlined),
            // ],
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: Text('Email'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.correo);
                  }),
              DataColumn(label: Text('UID')),
              DataColumn(label: Text('Acciones')),
            ],
            source: usersDatSource,
            onPageChanged: (page) {
              print('page $page');
            },
          )
        ],
      ),
    );
  }
}
