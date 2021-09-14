import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  UserModel? user;
  late GlobalKey<FormState> formKey;

  // hacer pensar como actualizar usuario del provider
  // una opcion
  // void updateListeners() {
  //   notifyListeners();
  // }

  copyUserWith({
    String? rol,
    String? apellidos,
    String? password,
    String? nombres,
    String? direccion,
    String? curso,
    String? correo,
    String? uid,
    String? img,
    String? celular,
    String? horario_atencion,
    String? area,
    int? edad,
  }) {
    user = new UserModel(
      role: rol ?? this.user!.role,
      apellidos: apellidos ?? this.user!.apellidos,
      password: password ?? this.user!.password,
      nombres: nombres ?? this.user!.nombres,
      email: correo ?? this.user!.email,
      celular: celular ?? this.user!.celular,
      direccion: direccion ?? this.user!.direccion,
      curso: curso ?? this.user!.curso,
      edad: edad ?? this.user!.edad,
      id: uid ?? this.user!.id,
      img: img ?? this.user!.img,
      horario_atencion: horario_atencion ?? this.user!.horario_atencion,
      area: area ?? this.user!.area,
    );
    notifyListeners();
  }

  copyUserWithCreate({
    String? rol,
    String? apellidos,
    String? password,
    String? nombres,
    String? direccion,
    String? curso,
    String? correo,
    String? uid,
    String? img,
    String? celular,
    String? horario_atencion,
    String? area,
    int? edad,
  }) {
    user = new UserModel(
      role: rol ?? this.user?.role,
      apellidos: apellidos ?? this.user?.apellidos,
      password: password ?? this.user?.password,
      nombres: nombres ?? this.user?.nombres,
      email: correo ?? this.user?.email,
      celular: celular ?? this.user?.celular,
      direccion: direccion ?? this.user?.direccion,
      curso: curso ?? this.user?.curso,
      edad: edad ?? this.user?.edad,
      id: uid ?? this.user?.id,
      img: img ?? this.user?.img,
      horario_atencion: horario_atencion ?? this.user?.horario_atencion,
      area: area ?? this.user?.area,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  updateUser() async {
    if (!this._validForm()) return false;

    final data = {
      'nombre': user!.nombres,
      'correo': user!.email,
      'edad': user!.edad,
      'apellido': user!.apellidos,
      'direccion': user!.direccion,
      'password': user!.password,
      'curso': user!.curso,
      'celular': user!.celular,
    };
    try {
      final resp = await LindemannApi.putEstudiante(user!.id!, data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }
  }

  updateProfesor() async {
    if (!this._validForm()) return false;

    final data = {
      'nombre': user!.nombres,
      'correo': user!.email,
      'edad': user!.edad,
      'apellido': user!.apellidos,
      'direccion': user!.direccion,
      'password': user!.password,
      'curso': user!.curso,
      'celular': user!.celular,
    };
    try {
      final resp = await LindemannApi.putProfesor(user!.id!, data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }
  }

  createUser() async {
    if (!this._validForm()) return false;
    print(user);
    final data = {
      'nombre': user!.nombres,
      'correo': user!.email,
      'edad': user!.edad,
      'apellido': user!.apellidos,
      'direccion': user!.direccion,
      'password': user!.password,
      'curso': user!.curso,
      'rol': user!.role,
      'celular': user!.celular,
    };
    print(data);
    try {
      final resp = await LindemannApi.putNuevoEstudiante(data);
      print(resp);
      return true;
    } catch (e) {
      print('error en crearUser: $e');
      return false;
    }
  }

  createProfesor() async {
    if (!this._validForm()) return false;
    print(user);
    final data = {
      'nombre': user!.nombres,
      'correo': user!.email,
      'edad': user!.edad,
      'apellido': user!.apellidos,
      'direccion': user!.direccion,
      'password': user!.password,
      'curso': user!.curso,
      'horario_atencion': user!.horario_atencion,
      'area': user!.area,
      'rol': user!.role,
      'celular': user!.celular,
    };
    print(data);
    try {
      final resp = await LindemannApi.putNuevoProfesor(data);
      print(resp);
      return true;
    } catch (e) {
      print('error en crearUser: $e');
      return false;
    }
  }

  Future<String> uploadImage(
    String userId,
    String nameFile,
    Uint8List bytes,
  ) async {
    // Subimos la imagen al storage, y obtenemos la url
    // si la url esta vacia algo salio mal
    // si la url no esta vacia se subio sin problemas

    // el nombre de la imagen esta basado en el nombre del archivo y el id del usuario
    final respUrl = await LindemannApi.uploadFileFirebase(
      '$nameFile-$userId.jpg', 
      bytes,
    );
    if (respUrl.isNotEmpty) {
      // Actualizamos al usuario
      user!.img = respUrl;
      // Mandamos los datos actualizados a firebase
      await LindemannApi.putEstudiante(userId, user!.toJson());
      return respUrl;
    }
    return '';
  }
}
