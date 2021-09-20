import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/calificaciones_datasource.dart';
import 'package:ssalindemann/models/profesor_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/profesor_provider.dart';
import 'package:ssalindemann/providers/user_form_provider.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

class CalificacionesView extends StatefulWidget {
  // AQUI SE MOSTRARA UNA LISTA DE LOS CURSOS AL HACER CLIK EN ESTRELLA IRA A LA LISTA DEL CURSO SELECCIONADO Y ESTARA LA CALIFICACION
  final String uid;

  const CalificacionesView({Key? key, required this.uid}) : super(key: key);
  @override
  _CalificacionesViewState createState() => _CalificacionesViewState();
}

class _CalificacionesViewState extends State<CalificacionesView> {
  Widget build(BuildContext context) {
    final profesorProvider = Provider.of<ProfesorProvider>(context);

    profesorProvider.getPaginatedCalificacionesbyId(widget.uid);

    // final profDB = profesorProvider.getPaginatedProfesorbyArea(widget.area);
    final calificacionDataSource = new CalificionesDataSource(
        profesorProvider.calificaciones, context, widget.uid);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Cursos a Calificar',
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
            columns: [
              DataColumn(
                label: Text('Curso'),
              ),
              DataColumn(
                label: Text('Materia'),
              ),
              DataColumn(label: Text('Acciones')),
            ],
            // source: usersDatSource,
            onPageChanged: (page) {
              print('page $page');
            },
            source: calificacionDataSource,
          )
        ],
      ),
    );
  }
}
