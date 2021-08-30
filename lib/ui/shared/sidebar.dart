import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/shared/widgets/logo.dart';
import 'package:ssalindemann/ui/shared/widgets/menu_item.dart';
import 'package:ssalindemann/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final user = Provider.of<AuthProvider>(context).user!;
    print(user.apellidos);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Main'),
          MenuItem(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Inicio',
              icon: Icons.home_filled,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuItem(
            text: 'Mi Perfil',
            icon: Icons.person_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.perfilRoute,
            onPressed: () =>
                NavigationService.replaceTo('/dashboard/perfil/${user.id}'),
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.cursosRoute,
            text: 'Cursos',
            icon: Icons.class__rounded,
            onPressed: () => navigateTo(Flurorouter.cursosRoute),
          ),
          MenuItem(
            text: 'Profesores',
            icon: Icons.people_outline_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.profesoresRoute,
            onPressed: () => navigateTo(Flurorouter.profesoresRoute),
          ),
          MenuItem(
            isActive:
                sideMenuProvider.currentPage == Flurorouter.calificacionesRoute,
            text: 'Calificaciones',
            icon: Icons.grade_outlined,
            onPressed: () => NavigationService.replaceTo(
                '/dashboard/calificaciones/${user.id}'),
          ),

          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.notasRoute,
            text: 'Notas',
            icon: Icons.grade_outlined,
            onPressed: () => navigateTo(Flurorouter.notasRoute),
          ),

          MenuItem(
            text: 'Horarios',
            icon: Icons.schedule_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.horarioRoute,
            onPressed: () => navigateTo(Flurorouter.horarioRoute),
          ),
          // MenuItem(
          //   isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
          //   text: 'Estudiantes',
          //   icon: Icons.layers_outlined,
          //   onPressed: () => navigateTo(Flurorouter.usersRoute),
          // ),
          // MenuItem(
          //   isActive: sideMenuProvider.currentPage == Flurorouter.profesorRoute,
          //   text: 'Profesor',
          //   icon: Icons.layers_outlined,
          //   onPressed: () => navigateTo(Flurorouter.profesorRoute),
          // ),
          // MenuItem(
          //   text: 'Users',
          //   icon: Icons.dashboard_outlined,
          //   isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
          //   onPressed: () => navigateTo(Flurorouter.usersRoute),
          // ),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Redes Sociales'),
          MenuItem(
            text: 'Facebook',
            icon: Icons.access_alarm,
            isActive: false,
            onPressed: () {},
          ),

          MenuItem(
            text: 'Gmail',
            icon: Icons.email_outlined,
            isActive: false,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Informacion',
            icon: Icons.info,
            isActive: sideMenuProvider.currentPage == Flurorouter.aboutRoute,
            onPressed: () => navigateTo(Flurorouter.aboutRoute),
          ),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Cerrar Sesion'),
          MenuItem(
            text: 'Salir',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient:
          LinearGradient(colors: [Color(0xff361A0D), Colors.brown.shade900]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
