import 'package:flutter/material.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/cards/areas_card.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class ProfesoresView extends StatelessWidget {
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
                title: 'Literatura',
                onPressed: () {
                  print('click en literatura');
                  NavigationService.replaceAreaTo(
                      '/dashboard/profesor/Literatura');
                },
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
                title: 'Matemáticas y Técnica',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.calculate_outlined,
                    color: Colors.white,
                  )),
                ),
                onPressed: () {
                  NavigationService.replaceTo(
                      '/dashboard/profesor/Matematicas');
                },
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
                onPressed: () {
                  NavigationService.replaceTo(
                      '/dashboard/profesor/CienciasNaturales');
                },
                width: 220,
                color: Colors.green.shade700,
              ),
              AreasCard(
                title: 'Sociales',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.brightness_5_outlined,
                    color: Colors.white,
                  )),
                ),
                onPressed: () {
                  NavigationService.replaceTo('/dashboard/profesor/Sociales');
                },
                width: 220,
                color: Colors.purple.shade700,
              ),
              AreasCard(
                title: 'Cosmovision y Psicología',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.psychology_outlined,
                    color: Colors.white,
                  )),
                ),
                onPressed: () {
                  NavigationService.replaceTo(
                      '/dashboard/profesor/Cosmovision');
                },
                width: 220,
                color: Colors.blue.shade700,
              ),
              AreasCard(
                title: 'Artes y Educación Física',
                child: Center(
                  child: Center(
                      child: Icon(
                    Icons.art_track_outlined,
                    color: Colors.white,
                  )),
                ),
                onPressed: () {
                  NavigationService.replaceTo('/dashboard/profesor/Artes');
                },
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
                onPressed: () {
                  NavigationService.replaceTo(
                      '/dashboard/profesor/Administrativos');
                },
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
