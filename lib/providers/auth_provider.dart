import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/http/auth_response.dart';
import 'package:ssalindemann/models/usuario.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/local_storage.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/services/notifications_service.dart';

enum AuthStatus { cheking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.cheking;
  Usuario? user;
  AuthProvider() {
    this.isAuthenticated();
  }

  login(String usuario, String password) {
    // TODO peticion HTTP
    final data = {
      'correo': usuario,
      'password': password,
    };

    LindemannApi.post('/auth/login', data).then((json) {
      print(json);
      final authResponse = new AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      // aqui manda al dasboard
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      LindemannApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      // mostrar notificacion error
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
    // TODO navegar al dashboard
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // todo ir al backend y comprobar si el JWT es valido

    try {
      final resp = await LindemannApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  register(String usuario, String password, String name) {
    // TODO peticion HTTP
    final data = {
      'nombre': name,
      'correo': usuario,
      'password': password,
    };

    LindemannApi.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = new AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      // aqui manda al dasboard
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      LindemannApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      // mostrar notificacion error
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
    // TODO navegar al dashboard
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
