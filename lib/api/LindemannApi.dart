import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/services/local_storage.dart';
import 'package:ssalindemann/services/notifications_service.dart';

class LindemannApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    // Base de url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // configurar headers

    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    // QueryDocumentSnapshot<Map<String, dynamic>>? userResponse;
    // final firebase =
    //     await FirebaseFirestore.instance.collection('usuarios').get();
    // final typeUsersRef = firebase.docs.first.reference;
    // final studentsRef = typeUsersRef.collection('estudiante');
    // final respStudent = await studentsRef.get();
    // List userResponse = respStudent.docs;
    // if (userResponse != null) {
    //   return UserModel.fromJson(userResponse.id, userResponse.data());
    // } else {
    //   return null;
    // }
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } on DioError catch (e) {
      print(e.response);
      throw ('Error en el GET');
    }
  }

  static Future<List<UserModel>> httpGetEstudiante() async {
    final firebase =
        await FirebaseFirestore.instance.collection('usuarios').get();
    final typeUsersRef = firebase.docs.first.reference;
    final studentsRef = typeUsersRef.collection('estudiante');
    final respStudent = await studentsRef.get();
    print(respStudent.docs);
    return List.from(
      respStudent.docs.map(
        (document) => UserModel.fromJson(document.id, document.data()),
      ),
    );
  }

  static Future<UserModel> httpGetUserbyId(String id) async {
    print(id);
    final firebase =
        await FirebaseFirestore.instance.collection('usuarios').get();
    final typeUsersRef = firebase.docs.first.reference;
    final studentsRef = typeUsersRef.collection('estudiante');
    final respStudent = await studentsRef.doc(id).get();
    print(respStudent.data());
    return UserModel.fromJson(id, respStudent.data()!);
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future<UserModel?> postLogin(String email, String password) async {
    QueryDocumentSnapshot<Map<String, dynamic>>? userResponse;

    final firebase =
        await FirebaseFirestore.instance.collection('usuarios').get();

    final typeUsersRef = firebase.docs.first.reference;

    final adminsRef = typeUsersRef.collection('admin');
    final studentsRef = typeUsersRef.collection('estudiante');
    final teachersRef = typeUsersRef.collection('profesor');

    final respAdmin = await adminsRef
        .where('correo', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    final respStudent = await studentsRef
        .where('correo', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    final respTeacher = await teachersRef
        .where('correo', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    if (respAdmin.docs.isNotEmpty) {
      userResponse = respAdmin.docs.first;
    }

    if (respStudent.docs.isNotEmpty) {
      userResponse = respStudent.docs.first;
    }

    if (respTeacher.docs.isNotEmpty) {
      userResponse = respTeacher.docs.first;
    }

    if (userResponse != null) {
      return UserModel.fromJson(userResponse.id, userResponse.data());
    } else {
      NotificationsService.showSnackbarError('Usuario/ Password no validos');
      return null;
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error en el PUT $e');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error en el DELETE');
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error en el PUT $e');
    }
  }
}
