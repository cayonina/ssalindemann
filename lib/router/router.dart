import 'package:fluro/fluro.dart';
import 'package:ssalindemann/router/about_handler.dart';
import 'package:ssalindemann/router/admin_handler.dart';
import 'package:ssalindemann/router/no_page_found_handler.dart';
import 'package:ssalindemann/ui/views/no_page_found_view.dart';

import 'dashboard_handler.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';
  // Auth Route

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String cursosRoute = '/dashboard/cursos';
  static String profesoresRoute = '/dashboard/profesores';
  static String categoriesRoute = '/dashboard/categories';
  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/users/:uid';
  static String horarioRoute = '/dashboard/horario';

  static String aboutRoute = '/about';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(cursosRoute,
        handler: DashboardHandlers.cursos,
        transitionType: TransitionType.fadeIn);
    router.define(profesoresRoute,
        handler: DashboardHandlers.profesores,
        transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);
    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);
    router.define(horarioRoute,
        handler: DashboardHandlers.horario,
        transitionType: TransitionType.fadeIn);

    router.define(aboutRoute,
        handler: AboutHandlers.about, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
