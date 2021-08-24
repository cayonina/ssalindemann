import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/buttons/link_text.dart';
import 'package:ssalindemann/ui/cards/cursos_card.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';
import 'package:ssalindemann/ui/shared/widgets/text_separator.dart';

// esta es la base de una nueva vista del panel administrativo
class CursosView extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Cursos',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              CursosCard(
                title: 'Primero A',
                onPressed: () {
                  print('click Primero A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/1A');
                },
                child: Center(
                    child: Text(
                  '1ro. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.green.shade500,
              ),
              CursosCard(
                title: 'Primero B',
                onPressed: () {
                  print('click Primero B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/1B');
                },
                child: Center(
                    child: Text(
                  '1ro. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.green.shade500,
              ),
              CursosCard(
                title: 'Primero C',
                onPressed: () {
                  print('click Primero C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/1C');
                },
                child: Center(
                    child: Text(
                  '1ro. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.green.shade500,
              ),
              CursosCard(
                title: 'Primero D',
                onPressed: () {
                  print('click Primero D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/1D');
                },
                child: Center(
                    child: Text(
                  '1ro. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.green.shade500,
              ),
              CursosCard(
                title: 'Primero E',
                onPressed: () {
                  print('click Primero E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/1E');
                },
                child: Center(
                    child: Text(
                  '1ro. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.green.shade500,
              ),
              TextSeparator(text: 'Salir'),
              CursosCard(
                title: 'Segundo A',
                onPressed: () {
                  print('click Segundo A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/2A');
                },
                child: Center(
                    child: Text(
                  '2do. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.blue.shade500,
              ),
              CursosCard(
                title: 'Segundo B',
                onPressed: () {
                  print('click Segundo B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/2B');
                },
                child: Center(
                    child: Text(
                  '2do. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.blue.shade500,
              ),
              CursosCard(
                title: 'Segundo C',
                onPressed: () {
                  print('click Segundo C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/2C');
                },
                child: Center(
                    child: Text(
                  '2do. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.blue.shade500,
              ),
              CursosCard(
                title: 'Segundo D',
                onPressed: () {
                  print('click Segundo D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/2D');
                },
                child: Center(
                    child: Text(
                  '2do. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.blue.shade500,
              ),
              CursosCard(
                title: 'Segundo E',
                onPressed: () {
                  print('click Segundo E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/2E');
                },
                child: Center(
                    child: Text(
                  '2do. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.blue.shade500,
              ),
              TextSeparator(text: 'Salir'),
              CursosCard(
                title: 'Tercero A',
                onPressed: () {
                  print('click Tercero A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/3A');
                },
                child: Center(
                    child: Text(
                  '3ro. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.purple.shade500,
              ),
              CursosCard(
                title: 'Tercero B',
                onPressed: () {
                  print('click Tercero B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/3B');
                },
                child: Center(
                    child: Text(
                  '3ro. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.purple.shade500,
              ),
              CursosCard(
                title: 'Tercero C',
                onPressed: () {
                  print('click Tercero C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/3C');
                },
                child: Center(
                    child: Text(
                  '3ro. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.purple.shade500,
              ),
              CursosCard(
                title: 'Tercero D',
                onPressed: () {
                  print('click Tercero D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/3D');
                },
                child: Center(
                    child: Text(
                  '3ro. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.purple.shade500,
              ),
              CursosCard(
                title: 'Tercero E',
                onPressed: () {
                  print('click Tercero E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/3E');
                },
                child: Center(
                    child: Text(
                  '3ro. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.purple.shade500,
              ),
              TextSeparator(text: 'Salir'),
              CursosCard(
                title: 'Cuarto A',
                onPressed: () {
                  print('click Cuarto A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/4A');
                },
                child: Center(
                    child: Text(
                  '4to. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.orange.shade500,
              ),
              CursosCard(
                title: 'Cuarto B',
                onPressed: () {
                  print('click Cuarto B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/4B');
                },
                child: Center(
                    child: Text(
                  '4to. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.orange.shade500,
              ),
              CursosCard(
                title: 'Cuarto C',
                onPressed: () {
                  print('click Cuarto C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/4C');
                },
                child: Center(
                    child: Text(
                  '4to. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.orange.shade500,
              ),
              CursosCard(
                title: 'Cuarto D',
                onPressed: () {
                  print('click Cuarto D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/4D');
                },
                child: Center(
                    child: Text(
                  '4to. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.orange.shade500,
              ),
              CursosCard(
                title: 'Cuarto E',
                onPressed: () {
                  print('click Cuarto E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/4E');
                },
                child: Center(
                    child: Text(
                  '4to. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.orange.shade500,
              ),
              TextSeparator(text: 'Salir'),
              CursosCard(
                title: 'Quinto A',
                onPressed: () {
                  print('click Quinto A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/5A');
                },
                child: Center(
                    child: Text(
                  '5to. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.red.shade500,
              ),
              CursosCard(
                title: 'Quinto B',
                onPressed: () {
                  print('click Quinto B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/5B');
                },
                child: Center(
                    child: Text(
                  '5to. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.red.shade500,
              ),
              CursosCard(
                title: 'Quinto C',
                onPressed: () {
                  print('click Quinto C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/5C');
                },
                child: Center(
                    child: Text(
                  '5to. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.red.shade500,
              ),
              CursosCard(
                title: 'Quinto D',
                onPressed: () {
                  print('click Quinto D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/5D');
                },
                child: Center(
                    child: Text(
                  '5to. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.red.shade500,
              ),
              CursosCard(
                title: 'Quinto E',
                onPressed: () {
                  print('click Quinto E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/5E');
                },
                child: Center(
                    child: Text(
                  '5to. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.red.shade500,
              ),
              TextSeparator(text: 'Salir'),
              CursosCard(
                title: 'Sexto A',
                onPressed: () {
                  print('click Sexto A');
                  NavigationService.replaceCursoTo('/dashboard/cursos/6A');
                },
                child: Center(
                    child: Text(
                  '6to. "A"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.brown.shade500,
              ),
              CursosCard(
                title: 'Sexto B',
                onPressed: () {
                  print('click Sexto B');
                  NavigationService.replaceCursoTo('/dashboard/cursos/6B');
                },
                child: Center(
                    child: Text(
                  '6to. "B"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.brown.shade500,
              ),
              CursosCard(
                title: 'Sexto C',
                onPressed: () {
                  print('click Sexto C');
                  NavigationService.replaceCursoTo('/dashboard/cursos/6C');
                },
                child: Center(
                    child: Text(
                  '6to. "C"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.brown.shade500,
              ),
              CursosCard(
                title: 'Sexto D',
                onPressed: () {
                  print('click Sexto D');
                  NavigationService.replaceCursoTo('/dashboard/cursos/6D');
                },
                child: Center(
                    child: Text(
                  '6to. "D"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.brown.shade500,
              ),
              CursosCard(
                title: 'Sexto E',
                onPressed: () {
                  print('click Sexto E');
                  NavigationService.replaceCursoTo('/dashboard/cursos/6E');
                },
                child: Center(
                    child: Text(
                  '6to. "E"',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                width: 170,
                color: Colors.brown.shade500,
              ),
            ],
          )
        ],
      ),
    );
  }
}
