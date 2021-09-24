import 'user_model.dart';

class EstudianteModel extends UserModel {
  final List<Notes> notes;
  EstudianteModel({
    required String id,
    required String role,
    required String apellidos,
    required String nombres,
    required String email,
    required int edad,
    required String password,
    required String celular,
    required String direccion,
    required String curso,
    String? horarioAtencion,
    String? area,
    String? img,
    required this.notes,
  }) : super(
          id: id,
          role: role,
          apellidos: apellidos,
          nombres: nombres,
          email: email,
          edad: edad,
          password: password,
          celular: celular,
          direccion: direccion,
          curso: curso,
          horario_atencion: horarioAtencion,
          area: area,
          img: img,
        );

  factory EstudianteModel.fromJson(
    String id,
    Map<String, dynamic> json,
    List<Map<String, dynamic>> jsonNotes,
  ) =>
      EstudianteModel(
        id: id,
        role: json['rol'],
        apellidos: json['apellido'],
        nombres: json['nombre'],
        email: json['correo'],
        edad: json['edad'],
        password: json['password'],
        celular: json['celular'],
        curso: json['curso'],
        direccion: json['direccion'],
        notes: List.from(jsonNotes.map((j) => Notes.fromJson(j))),
      );
}

class Notes {
  final String? id;
  final String? materia;
  final String? commentOne, commentTwo, commentThree;
  final double? totalNote;

  final List<double> notesOne, notesTwo, notesThree;

  Notes({
    this.id,
    required this.commentOne,
    required this.commentTwo,
    required this.commentThree,
    required this.totalNote,
    required this.notesOne,
    required this.notesTwo,
    required this.notesThree,
    required this.materia,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json['id'],
        commentOne: json['comentario1'],
        commentTwo: json['comentario2'],
        commentThree: json['comentario3'],
        materia: json['materia'],
        totalNote: json['notafinal'] / 1,
        notesOne: List.from(json['notas1'].map((value) => value / 1)),
        notesTwo: List.from(json['notas2'].map((value) => value / 1)),
        notesThree: List.from(json['notas3'].map((value) => value / 1)),
      );
}
