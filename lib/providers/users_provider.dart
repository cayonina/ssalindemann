import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/http/users_response.dart';
import 'package:ssalindemann/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;
  UsersProvider() {
    this.getPaginatedUsers();
  }

  getPaginatedUsers() async {
    // peticion http
    final resp = await LindemannApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);
    this.users = [...usersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    // peticion http

    try {
      final resp = await LindemannApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void refreshUser(Usuario newUser) {
    this.users = this.users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }
}
