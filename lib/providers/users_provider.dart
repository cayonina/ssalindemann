import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/http/users_response.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<UserModel> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  String curso = null.toString();

  UsersProvider() {
    this.getPaginatedUsers();
  }

  getPaginatedUsers() async {
    // peticion http
    final resp = await LindemannApi.httpGetEstudiante();
    print(resp);
    this.users = [...resp];
    print(this.users.length);
    isLoading = false;
    notifyListeners();
  }

  void setCurso(String curso) {
    print("PROVIDEER: " + curso);
    this.curso = curso;
  }

  getPaginatedUsersbyCurso(String curso) async {
    // peticion http
    final resp = await LindemannApi.httpGetEstudianteByCurso(curso);
    print(resp);
    this.users = [...resp];
    print(this.users.length);
    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(UserModel user) getField) {
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

  Future<UserModel?> getUserById(String uid) async {
    // peticion http

    try {
      final resp = await LindemannApi.httpGetUserbyId(uid);

      return resp;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void refreshUser(UserModel newUser) {
    this.users = this.users.map((user) {
      if (user.id == newUser.id) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }

  Future deleteEstudiante(String id) async {
    try {
      await LindemannApi.deleteEstudiante(id);
      users.removeWhere((user) => user.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
      throw 'error al eliminar estudiantee';
    }
  }
}
