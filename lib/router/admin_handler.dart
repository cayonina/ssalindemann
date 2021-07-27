import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/ui/views/dashboard_view.dart';
import 'package:ssalindemann/ui/views/login_view.dart';
import 'package:ssalindemann/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });
}
