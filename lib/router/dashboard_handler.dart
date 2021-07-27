import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/views/categories_view.dart';
import 'package:ssalindemann/ui/views/cursos_view.dart';
import 'package:ssalindemann/ui/views/dashboard_view.dart';
import 'package:ssalindemann/ui/views/horario_view.dart';
import 'package:ssalindemann/ui/views/login_view.dart';
import 'package:ssalindemann/ui/views/profesores_view.dart';
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

  static Handler categories = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.categoriesRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CategoriesView();
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

  static Handler users = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrenPageUrl(Flurorouter.usersRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return UsersView();
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
        return UsersView();
      }
    }
    //
    else
      return LoginView();
  });
}
