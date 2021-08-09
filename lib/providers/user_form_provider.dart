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

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  updateUser() async {
    if (!this._validForm()) return false;

    final data = {'nombre': user!.nombres, 'correo': user!.email};
    try {
      final resp = await LindemannApi.put('/usuarios/${user!.id}', data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }
  }

  // Future<Usuario> uploadImage(String path, Uint8List bytes) async {
  //   try {
  //     final resp = await LindemannApi.uploadFile(path, bytes);
  //     user = Usuario.fromMap(resp);
  //     notifyListeners();
  //     return user!;
  //   } catch (e) {
  //     print(e);
  //     throw 'Error en user from provider';
  //   }
  // }
}
