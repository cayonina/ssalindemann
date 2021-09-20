import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/http/users_response.dart';
import 'package:ssalindemann/models/profesor_model.dart';
import 'package:ssalindemann/models/user_model.dart';

class ProfesorProvider extends ChangeNotifier {
  List<UserModel> users = [];
  List<Calificacion> calificaciones = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  String area = null.toString();

  // String area;
  ProfesorProvider() {
    // this.getPaginatedProfesor();
    // this.setArea(area);
    // this.getPaginatedProfesorbyArea(area);
  }

  void setArea(String area) {
    print("PROVIDEER: " + area);
    this.area = area;
  }

  getPaginatedProfesor() async {
    // peticion http
    final resp = await LindemannApi.httpGetProfesor();
    print(resp);
    this.users = [...resp];
    print(this.users.length);
    isLoading = false;
    notifyListeners();
  }

  getPaginatedProfesorbyArea(String area) async {
    print(area + "aqui provider");
    // peticion http
    final resp = await LindemannApi.httpGetProfesorbyArea(area);
    this.users = [...resp];
    print(this.users.length);
    isLoading = false;
    notifyListeners();
  }

  getPaginatedCalificacionesbyId(String uid) async {
    print(area + "aqui calificaciones");
    // peticion http
    final resp = await LindemannApi.httpGetProfesorCalificaionesbyId(uid);
    this.calificaciones = [...resp];
    print(this.calificaciones.length);
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

  Future<UserModel?> getProfesorById(String uid) async {
    // peticion http

    try {
      final resp = await LindemannApi.httpGetProfesorbyId(uid);

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

  Future deleteProfesor(String id) async {
    try {
      await LindemannApi.deleteProfesor(id);
      users.removeWhere((user) => user.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
      throw 'error al eliminar profesor';
    }
  }
}
