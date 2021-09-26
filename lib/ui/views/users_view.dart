import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/users_datasource.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class UsersView extends StatefulWidget {
  final String curso;
  const UsersView({Key? key, required this.curso}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    // usersProvider.setCurso(widget.curso);
    print(widget.curso + " desde users ahhh");
    usersProvider.getPaginatedUsersbyCurso(widget.curso);
    final usersDatSource =
        new UsersDataSource(usersProvider.users, context, widget.curso);

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
            'Estudiantes ' + widget.curso,
            style: CustomLabels.h2,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            header: Container(),

            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.nuevouserRoute);
                  },
                  text: 'Añadir Estudiante',
                  icon: Icons.add_outlined),
            ],
            columns: [
              DataColumn(label: Text('Foto')),
              DataColumn(
                  label: Text('Apellidos'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.apellidos!);
                  }),
              DataColumn(
                  label: Text('Nombres'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.nombres!);
                  }),
              DataColumn(
                  label: Text('Curso'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.curso!);
                  }),
              DataColumn(
                  label: Text('Celulares'),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.celular!);
                  }),
              DataColumn(label: Text('Acciones')),
            ],
            // source: usersDatSource,
            onPageChanged: (page) {
              print('page $page');
            },
            source: usersDatSource,
          )
        ],
      ),
    );
  }
}
