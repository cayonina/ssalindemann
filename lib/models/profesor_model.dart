import 'user_model.dart';

class ProfesorModel extends UserModel {
  final List<Calificacion> calificaciones;
  ProfesorModel({
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
    required this.calificaciones,
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

  factory ProfesorModel.fromJson(
    String id,
    Map<String, dynamic> json,
    List<Map<String, dynamic>> jsonNotes,
  ) =>
      ProfesorModel(
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
        calificaciones:
            List.from(jsonNotes.map((j) => Calificacion.fromJson(j))),
      );
}

class Calificacion {
  final String id;
  final String curso;
  final String materia;

  Calificacion({required this.id, required this.curso, required this.materia});

  factory Calificacion.fromJson(Map<String, dynamic> json) => Calificacion(
        id: json['id'],
        curso: json['curso'],
        materia: json['materia'],
      );
}
