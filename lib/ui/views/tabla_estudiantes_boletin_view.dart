import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/boletin_datasource.dart';
import 'package:ssalindemann/datatables/users_datasource.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/providers/estudiante_notas_provider.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class TablaEstudiantesBoletinView extends StatefulWidget {
  final String uidEstudiante;
  final String curso;
  final String nombreMateria;
  final String idNota;
  const TablaEstudiantesBoletinView(
      {Key? key,
      required this.uidEstudiante,
      required this.curso,
      required this.nombreMateria,
      required this.idNota})
      : super(key: key);

  @override
  _TablaEstudiantesBoletinViewState createState() =>
      _TablaEstudiantesBoletinViewState();
}

class _TablaEstudiantesBoletinViewState
    extends State<TablaEstudiantesBoletinView> {
  Notes? nota;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((duration) {
      final provider =
          Provider.of<EstudianteNotasProvider>(context, listen: false);
      provider.init(
        idEstu: widget.uidEstudiante,
        idNota: widget.idNota,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final notasProvider =
        Provider.of<EstudianteNotasProvider>(context, listen: false);
    print(widget.curso + " desde tabla boletiun wahh ahhh");

    usersProvider.getPaginatedUsersbyCurso(widget.curso);
    final boletinDatSource = new BoletinDataSource(usersProvider.users, context,
        widget.curso, notasProvider.notes, widget.idNota);

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
                    // Navigator.pushNamed(context, Flurorouter.nuevouserRoute);
                  },
                  text: 'Generar Reporte',
                  icon: Icons.report_outlined),
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
            source: boletinDatSource,
          )
        ],
      ),
    );
  }
}
