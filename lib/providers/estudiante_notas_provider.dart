import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/estudiante_model.dart';

class EstudianteNotasProvider extends ChangeNotifier {
  late String idEstudiante;
  late Notes notes;

  bool loading = true;

  Future init({required String idEstu, required String nombreMat}) async {
    print('==== INIT PROVIDER ===== $idEstu, $nombreMat ===');
    this.idEstudiante = idEstu;

    notes = await LindemannApi.httpGetNotaFromStudent(
      idStudent: idEstudiante,
      nameSubject: nombreMat,
    );

    loading = false;
    notifyListeners();
  }

  Future<bool> updateNota() async {
    try {
      await LindemannApi.httpUpdateNotaFromStudent(
        idStudent: idEstudiante,
        idNota: notes.id!,
        note: notes,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  void updateUI() {
    notifyListeners();
  }
}
