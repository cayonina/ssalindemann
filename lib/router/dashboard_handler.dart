import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/views/calificaciones_view.dart';
import 'package:ssalindemann/ui/views/cursos_view.dart';
import 'package:ssalindemann/ui/views/dashboard_view.dart';
import 'package:ssalindemann/ui/views/horario_view.dart';
import 'package:ssalindemann/ui/views/login_view.dart';
import 'package:ssalindemann/ui/views/notas_view.dart';
import 'package:ssalindemann/ui/views/nuevo_prof_view.dart';
import 'package:ssalindemann/ui/views/nuevo_user_view.dart';
import 'package:ssalindemann/ui/views/perfil_view.dart';
import 'package:ssalindemann/ui/views/prof_view.dart';
import 'package:ssalindemann/ui/views/profesores_view.dart';
import 'package:ssalindemann/ui/views/tabla_notas_view.dart';
import 'package:ssalindemann/ui/views/tabla_profesores_view.dart';
import 'package:ssalindemann/ui/views/user_view.dart';
import 'package:ssalindemann/ui/views/users_view.dart';

class DashboardHandlers {
  static Handler dashboard = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  static Handler cursos = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.cursosRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CursosView();
    else
      return LoginView();
  });

  static Handler profesores = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.profesoresRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return ProfesoresView();
    else
      return LoginView();
  });

  static Handler horario = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.horarioRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return HorarioView();
    else
      return LoginView();
  });

  static Handler notas = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.notasRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        return NotasView(
          uidEstudiante: params['uid']!.first,
          nombreMateria: params['materia']!.first,
          idNota: params['idNota']!.first,
        );
      } else {
        return CursosView();
      }
    }
  });

  static Handler calificaciones = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.calificacionesRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        print("aquiiiiiiiiiiiiiiiiiiii " + params['uid']!.first);
        return CalificacionesView(uid: params['uid']!.first);
      } else {
        return DashboardView();
      }
    } else
      return LoginView();
  });

  static Handler tablanotas = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.tablaNotasRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        print("aquiiiiiiiiiiiiiiiiiiii " + params['uid']!.first);
        return TablaNotasView(uid: params['uid']!.first);
      } else {
        return DashboardView();
      }
    } else
      return LoginView();
  });

  static Handler perfil = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.perfilRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        return PerfilView(uid: params['uid']!.first);
      } else {
        return DashboardView();
      }
    }
    //
    else
      return LoginView();
  });

  static Handler users = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.usersRoute);
    // if (authProvider.authStatus == AuthStatus.authenticated)
    //   return UsersView();
    // else
    //   return LoginView();
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['curso']?.first != null) {
        print("aquiiiiiiiiiiiiiiiiiiii " + params['curso']!.first);
        return UsersView(curso: params['curso']!.first);
      } else {
        return CursosView();
      }
    } else
      return LoginView();
  });

  static Handler nuevouser = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.nuevouserRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return NuevoUserView();
    else
      return LoginView();
  });

  static Handler nuevoprof = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.nuevoprofRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return NuevoProfView();
    else
      return LoginView();
  });

  static Handler user = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.userRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        return UserView(uid: params['uid']!.first);
      } else {
        return CursosView();
      }
    }
    //
    else
      return LoginView();
  });

  static Handler prof = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.profRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['uid']?.first != null) {
        return ProfView(uid: params['uid']!.first);
      } else {
        return ProfesoresView();
      }
    }
    //
    else
      return LoginView();
  });

  static Handler profesor = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.profesorRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      print(params);
      if (params['area']?.first != null) {
        print("aquiiiiiiiiiiiiiiiiiiii " + params['area']!.first);
        return TablaProfesoresView(area: params['area']!.first);
      } else {
        return ProfesoresView();
      }
    } else
      return LoginView();
  });
}
