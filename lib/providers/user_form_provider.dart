import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  late GlobalKey<FormState> formKey;

  // hacer pensar como actualizar usuario del provider
  // una opcion
  // void updateListeners() {
  //   notifyListeners();
  // }

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = new Usuario(
      rol: rol ?? this.user!.rol,
      estado: estado ?? this.user!.estado,
      google: google ?? this.user!.google,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      uid: uid ?? this.user!.uid,
      img: img ?? this.user!.img,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  updateUser() async {
    if (!this._validForm()) return false;

    final data = {'nombre': user!.nombre, 'correo': user!.correo};
    try {
      final resp = await LindemannApi.put('/usuarios/${user!.uid}', data);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }
  }

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await LindemannApi.uploadFile(path, bytes);
      user = Usuario.fromMap(resp);
      notifyListeners();
      return user!;
    } catch (e) {
      print(e);
      throw 'Error en user from provider';
    }
  }
}
