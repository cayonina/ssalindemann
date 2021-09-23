import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/estudiante_model.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  UserModel? user;
  Notes? estudianteNota;
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

  Future<String> uploadImageProfesor(
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
      await LindemannApi.putProfesor(userId, user!.toJson());
      return respUrl;
    }
    return '';
  }

  copyEstudianteNotaWith({
    String? id,
    String? materia,
    String? commentOne,
    String? commentTwo,
    String? commentThree,
    List<double>? notesOne,
    List<double>? notesTwo,
    List<double>? notesThree,
    double? totalNote,
  }) {
    estudianteNota = new Notes(
        commentOne: commentOne ?? this.estudianteNota!.commentOne,
        commentTwo: commentTwo ?? this.estudianteNota!.commentTwo,
        commentThree: commentThree ?? this.estudianteNota!.commentThree,
        materia: materia ?? this.estudianteNota!.materia,
        notesOne: notesOne ?? this.estudianteNota!.notesOne,
        notesTwo: notesTwo ?? this.estudianteNota!.notesTwo,
        notesThree: notesThree ?? this.estudianteNota!.notesThree,
        totalNote: totalNote ?? this.estudianteNota!.totalNote,
        id: id ?? this.estudianteNota!.id);
    notifyListeners();
  }

  copyEstudianteNotaWithCreate({
    String? id,
    String? materia,
    String? commentOne,
    String? commentTwo,
    String? commentThree,
    List<double>? notesOne,
    List<double>? notesTwo,
    List<double>? notesThree,
    double? totalNote,
  }) {
    estudianteNota = new Notes(
        commentOne: commentOne ?? this.estudianteNota!.commentOne,
        commentTwo: commentTwo ?? this.estudianteNota!.commentTwo,
        commentThree: commentThree ?? this.estudianteNota!.commentThree,
        materia: materia ?? this.estudianteNota!.materia,
        notesOne: notesOne ?? this.estudianteNota!.notesOne,
        notesTwo: notesTwo ?? this.estudianteNota!.notesTwo,
        notesThree: notesThree ?? this.estudianteNota!.notesThree,
        totalNote: totalNote ?? this.estudianteNota!.totalNote,
        id: id ?? this.estudianteNota!.id);
    notifyListeners();
  }

  createNotaEstudiante() async {
    if (!this._validForm()) return false;
    print(estudianteNota);
    final data = {
      'comentario1': estudianteNota!.commentOne,
      'comentario2': estudianteNota!.commentTwo,
      'comentario3': estudianteNota!.commentThree,
      'materia': estudianteNota!.materia,
      'notafinal': estudianteNota!.totalNote,
      'notas1': estudianteNota!.notesOne,
      'notas2': estudianteNota!.commentTwo,
      'notas3': estudianteNota!.commentThree,
    };
    print(data);
    try {
      final resp = await LindemannApi.putNuevaNotaEstudiante(data, user!.id!);
      print(resp);
      return true;
    } catch (e) {
      print('error en createNotaEstudiante: $e');
      return false;
    }
  }

  updateNotaEstudiante() async {
    if (!this._validForm()) return false;
    print(estudianteNota);
    final data = {
      'comentario1': estudianteNota!.commentOne,
      'comentario2': estudianteNota!.commentTwo,
      'comentario3': estudianteNota!.commentThree,
      'materia': estudianteNota!.materia,
      'notafinal': estudianteNota!.totalNote,
      'notas1': estudianteNota!.notesOne,
      'notas2': estudianteNota!.commentTwo,
      'notas3': estudianteNota!.commentThree,
    };
    print(data);
    try {
      final resp = await LindemannApi.putNotaEstudiante(data, user!.id!);
      print(resp);
      return true;
    } catch (e) {
      print('error en updateNotaEstudiante: $e');
      return false;
    }
  }
}
