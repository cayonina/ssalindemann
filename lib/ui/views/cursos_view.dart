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
                onPressed: () => navigateTo(Flurorouter.usersRoute),
                title: 'Primero A',
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
              LinkText(
                text: 'ingresa',
                onPressed: () => navigateTo(Flurorouter.usersRoute),
              )
            ],
          )
        ],
      ),
    );
  }
}
