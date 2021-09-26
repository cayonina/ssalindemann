import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/estudiante_model.dart';

class EstudianteNotasProvider extends ChangeNotifier {
  late String idEstudiante;
  late String idNota;
  late Notes notes;

  bool loading = true;

  Future init({required String idEstu, required String idNota}) async {
    this.idEstudiante = idEstu;
    this.idNota = idNota;
    print('==== INIT PROVIDER =====  ===');

    notes = await LindemannApi.httpGetNotaFromStudent(
      idStudent: idEstudiante,
      idNota: idNota,
    );

    loading = false;
    notifyListeners();
  }

  Future<bool> updateNota() async {
    try {
      await LindemannApi.httpUpdateNotaFromStudent(
        idStudent: idEstudiante,
        idNota: idNota,
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
