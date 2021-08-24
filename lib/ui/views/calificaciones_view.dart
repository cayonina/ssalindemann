import 'package:flutter/material.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

class CalificacionesView extends StatelessWidget {
  // AQUI SE MOSTRARA UNA LISTA DE LOS CURSOS AL HACER CLIK EN ESTRELLA IRA A LA LISTA DEL CURSO SELECCIONADO Y ESTARA LA CALIFICACION
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Calificaciones View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(title: 'Sales statistics', child: Text('Hola Mundo'))
        ],
      ),
    );
  }
}
