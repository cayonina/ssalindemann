import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/notas_datasource.dart';
import 'package:ssalindemann/datatables/profesor_datasource.dart';
import 'package:ssalindemann/datatables/users_datasource.dart';
import 'package:ssalindemann/providers/profesor_provider.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class TablaNotasView extends StatefulWidget {
  final String uid;

  const TablaNotasView({Key? key, required this.uid}) : super(key: key);

  @override
  _TablaNotasViewState createState() => _TablaNotasViewState();
}

class _TablaNotasViewState extends State<TablaNotasView> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    // print("ESTAMOS TABLA " + widget.area);
    // profesorProvider.setArea(widget.area);
    // print("AAAAHHH " + profesorProvider.area);
    userProvider.getPaginatedNotasbyId(widget.uid);

    // final profDB = profesorProvider.getPaginatedProfesorbyArea(widget.area);
    final notasDataSource =
        new NotasDataSource(userProvider.notas, context, widget.uid);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Lista de Materias',
            style: CustomLabels.h1,
          ),
          Text(
            widget.uid,
            style: CustomLabels.h2,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            header: Container(),

            sortAscending: userProvider.ascending,
            sortColumnIndex: userProvider.sortColumnIndex,

            columns: [
              DataColumn(
                  label: Text('Materia'),
                  onSort: (colIndex, _) {
                    userProvider.sortColumnIndex = colIndex;
                    userProvider.sort<String>((user) => user.apellidos!);
                  }),
              DataColumn(label: Text('Acciones')),
            ],
            // source: usersDatSource,
            onPageChanged: (page) {
              print('page $page');
            },
            source: notasDataSource,
          )
        ],
      ),
    );
  }
}
