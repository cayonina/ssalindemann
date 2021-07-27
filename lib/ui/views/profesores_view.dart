import 'package:flutter/material.dart';
import 'package:ssalindemann/ui/cards/areas_card.dart';
import 'package:ssalindemann/ui/cards/cursos_card.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class ProfesoresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Profesores',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              AreasCard(
                title: 'Lenguaje y Comunicaciones',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.book_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.orange.shade700,
              ),
              AreasCard(
                title: 'Ciencias Exactas',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.calculate_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.red.shade700,
              ),
              AreasCard(
                title: 'Ciencias Naturales',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.nature_people_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.green.shade700,
              ),
              AreasCard(
                title: 'Ciencias Sociales',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.brightness_5_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.purple.shade700,
              ),
              AreasCard(
                title: 'Tecnologia',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.blue.shade700,
              ),
              AreasCard(
                title: 'Extracurriculares',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.sports_soccer_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.pink.shade700,
              ),
              AreasCard(
                title: 'Administrativos',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.white,
                  )),
                ),
                width: 220,
                color: Colors.brown.shade700,
              ),
            ],
          )
        ],
      ),
    );
  }
}
