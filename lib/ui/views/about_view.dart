import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssalindemann/ui/cards/areas_card.dart';
import 'package:ssalindemann/ui/cards/cursos_card.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Informacion',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(
              title: 'Historia',
              child: Text(
                '''- Prof. Benavjoes Paredes Miley Vania
- Prof. Casas Rojas Marisel Carolina
Reseña Histórica:
La Unidad Educativa Enrique Lindemann B se fundó en la Villa de Obrajes, el 19 de Marzo de 1959 con el nombre de Colegio Secundario 6 de Junio en homenaje al dia del Maestro.
El primer plantel docente y administrativo funcionó a la cabeza de la profesora Elga Castedo de Frech con sesenta alumnos y el siguiente Plantel Docente y Administrativo:
Directora, Prof. Elga Castedo de Frech.
Plantel Docente:
  * Prof. Aida Mendoza, 
  * Prof.Marina de Ostman, 
  * Prof. Celestina de Trigoso, 
  * Prof. Jaime Ríos, 
  * Prof. Pepa de Cromembol, 
  * Prof. Soledad Larrea. 
  * Prof. Raul Dueñas, 
  * Prof. José Ramirez, 
  * Prof. Alberto del Llano, 
  * Prof. Ernesto Barreda, 
  * Prof. Luis Suna Morales, 
  * Secretaria Hortencia Moreno, 
  * Portera Ernestina Sanjines.
Padres de Familia: 
  * Sr.Victor Manrique,
  * Sr. Juan Peñaloza, 
  * Sr. Melecio Chacón, 
  * Sra. Yolanda Mercado, 
  * Sra. Candelaria Vda. De Gandarillas
  * Sra. Remedios Heredia
En 1960 cambia el nombre de Colegio Secundario 6 de Junio a Enrique Lindemann en homenaje y reconocimiento al señor Enrique Lindemann por la donación de un terreno y edificaciones de seis mil doscientos metros
cuadrados entregado por la Sra. Mia Huberty Vda. De Lindemann. 
La entrega oficial se realizó el 29 de octubre de 1960 a cargo del Ministro de Educación José Fellman Velarde.
En 1964 egresa la primera promoción de bachilleres con 11 alumnos y lleva el nombre de la Directora fundadora, profesora "Elga Castedo de Frech".
En 1969 por orden ministerial se divide en Ciclo Intermedio y Ciclo Medio. 
El 27 de octubre de 1976, en el Gobierno del General Hugo Banzer Suarez, se realizó la entrega de la infraestructura actual por el Ministro de Educación , Coronel Waldo Bernal Pereira.
En la gestión escolar de 2009 se define el logotipo de las promociones futuras, manteniendo los colores de la bandera CAFÉ Y AMARILLO y restableciéndose el INTI.
Es el primer Colegio Fiscal fundado en la Zona Sur de la Ciudad de La Paz, y en esta gestión 2014 egresa la Promoción de Bachilleres NO 50, es la Promoción
Bodas de Oro, durante este tiempo de trabajo al servicio de la Educación en Bolivia, el Colegio tiene a distinguidos profesionales que salieron de sus aulas como el actual Ministro de Educación, Roberto Aguilar, que es ex-alumno del Colegio.
También es necesario enfatizar la calidad profesional del Personal Docente, con altos niveles de preparación en el campo docente e incluso en otras profesiones, y su colaboración junto a los Padres de Familia y estudiantes para implementar
y poner en funcionamiento la Sala Audiovisual, la Sala de Computación y la Banda de Guerra que es una de las más importantes de la Zona Sur de las
Unidades Educativas Fiscales, la misma que fue fundada a partir del año 2000.
Otro aspecto para destacar es el referido al Personal Administrativo, quienes acceden al uso de computadoras en forma personal.
Por último, es importante señalar que la actual Dirección mantiene la filosofía y metodología de trabajo de acuerdo a los cambios de la Ley Educativa NO 070.
Agenda 2019 U E. Lindemann 7''',
                style: GoogleFonts.raleway(fontSize: 14),
              )),
          SizedBox(
            height: 10,
          ),
          WhiteCard(
              title: 'Himno al Colegio Unidad Educativa Enrique Lindemann',
              child: Text(
                '''
            - Letra y Musica: Prof. Mario L. Delgado D.


            Mi Colegio, es crisol del saber,
            la promesa de la juventud,
            es la luz que irradia el deber:
            Libertad, Igualdad, Hermandad.
            

                                        Renovar a la Patria, es vivir,
                                        con valor y firmeza seguir,
                                        de los libres la senda febril.
                                        Ella, lauros nos da de ceñir.


            CORO
            MI COLEGIO ES LINDEMANN,
            DE LA PATRIA PORVENIR,
            SON SUS AULAS LUZ Y VERDAD,
            EL ESTUDIO SU HIMNO TRIUNFAL (Bis)
            ''',
                style: GoogleFonts.raleway(),
              ))
        ],
      ),
    );
  }
}
