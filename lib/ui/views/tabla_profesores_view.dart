import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/profesor_datasource.dart';
import 'package:ssalindemann/datatables/users_datasource.dart';
import 'package:ssalindemann/providers/profesor_provider.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class TablaProfesoresView extends StatefulWidget {
  final String area;

  const TablaProfesoresView({Key? key, required this.area}) : super(key: key);

  @override
  _TablaProfesoresViewState createState() => _TablaProfesoresViewState();
}

class _TablaProfesoresViewState extends State<TablaProfesoresView> {
  @override
  Widget build(BuildContext context) {
    final profesorProvider = Provider.of<ProfesorProvider>(context);
    // print("ESTAMOS TABLA " + widget.area);
    profesorProvider.setArea(widget.area);
    print("AAAAHHH " + profesorProvider.area);
    profesorProvider.getPaginatedProfesorbyArea(widget.area);

    // final profDB = profesorProvider.getPaginatedProfesorbyArea(widget.area);
    final profesorDataSource =
        new ProfesorDataSource(profesorProvider.users, context, widget.area);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Profesores',
            style: CustomLabels.h1,
          ),
          Text(
            widget.area,
            style: CustomLabels.h2,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            header: Container(),

            sortAscending: profesorProvider.ascending,
            sortColumnIndex: profesorProvider.sortColumnIndex,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.nuevoprofRoute);
                  },
                  text: 'Añadir Profesor',
                  icon: Icons.add_outlined),
            ],
            columns: [
              DataColumn(label: Text('Foto')),
              DataColumn(
                  label: Text('Apellidos'),
                  onSort: (colIndex, _) {
                    profesorProvider.sortColumnIndex = colIndex;
                    profesorProvider.sort<String>((user) => user.apellidos!);
                  }),
              DataColumn(
                  label: Text('Nombres'),
                  onSort: (colIndex, _) {
                    profesorProvider.sortColumnIndex = colIndex;
                    profesorProvider.sort<String>((user) => user.nombres!);
                  }),
              DataColumn(
                  label: Text('Area'),
                  onSort: (colIndex, _) {
                    profesorProvider.sortColumnIndex = colIndex;
                    profesorProvider.sort<String>((user) => user.area!);
                  }),
              DataColumn(
                  label: Text('Celulares'),
                  onSort: (colIndex, _) {
                    profesorProvider.sortColumnIndex = colIndex;
                    profesorProvider.sort<String>((user) => user.celular!);
                  }),
              DataColumn(label: Text('Acciones')),
            ],
            // source: usersDatSource,
            onPageChanged: (page) {
              print('page $page');
            },
            source: profesorDataSource,
          )
        ],
      ),
    );
  }
}
