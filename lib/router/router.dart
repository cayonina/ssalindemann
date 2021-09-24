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

  static String usersRoute = '/dashboard/cursos/:curso';
  static String userRoute = '/dashboard/cursos/:curso/:uid';
  static String nuevouserRoute = '/dashboard/nuevousers';
  static String profRoute = '/dashboard/profesor/:area/:uid';
  static String profesorRoute = '/dashboard/profesor/:area';
  static String nuevoprofRoute = '/dashboard/nuevoprof';
  static String horarioRoute = '/dashboard/horario';
  static String calificacionesRoute = '/dashboard/calificaciones/:uid';
  static String tablaNotasRoute = '/dashboard/tablanotas/:uid';
  static String notasRoute = '/dashboard/notas/:uid/:materia';
  static String perfilRoute = '/dashboard/perfil/:uid';

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

    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);
    router.define(nuevouserRoute,
        handler: DashboardHandlers.nuevouser,
        transitionType: TransitionType.fadeIn);
    router.define(nuevoprofRoute,
        handler: DashboardHandlers.nuevoprof,
        transitionType: TransitionType.fadeIn);

    router.define(horarioRoute,
        handler: DashboardHandlers.horario,
        transitionType: TransitionType.fadeIn);
    router.define(calificacionesRoute,
        handler: DashboardHandlers.calificaciones,
        transitionType: TransitionType.fadeIn);
    router.define(tablaNotasRoute,
        handler: DashboardHandlers.tablanotas,
        transitionType: TransitionType.fadeIn);
    router.define(notasRoute,
        handler: DashboardHandlers.notas,
        transitionType: TransitionType.fadeIn);

    router.define(perfilRoute,
        handler: DashboardHandlers.perfil,
        transitionType: TransitionType.fadeIn);

    router.define(profesorRoute,
        handler: DashboardHandlers.profesor,
        transitionType: TransitionType.fadeIn);
    router.define(profRoute,
        handler: DashboardHandlers.prof, transitionType: TransitionType.fadeIn);

    router.define(aboutRoute,
        handler: AboutHandlers.about, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
