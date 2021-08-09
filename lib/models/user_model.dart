class UserModel {
  UserModel({
    required this.id,
    required this.role,
    required this.apellidos,
    required this.nombres,
    required this.email,
    required this.edad,
    required this.password,
    required this.celular,
    required this.direccion,
    required this.curso,
    required this.horario_atencion,
    required this.area,
    this.img,
  });

  final String? id;
  final String? role;
  final String? apellidos;
  final String? nombres;
  final String? email;
  final int? edad;
  final String? password;
  final String? celular;
  final String? curso;
  final String? direccion;
  final String? img;
  final String? horario_atencion;
  final String? area;

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
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
        img: json['img'],
        horario_atencion: json['horario_atencion'],
        area: json['area'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'rol': role,
        'apellido': apellidos,
        'nombre': nombres,
        'correo': email,
        'edad': edad,
        'password': password,
        'celular': celular,
        'curso': curso,
        'direccion': direccion,
        'horario_atencion': horario_atencion,
        'area': area,
        'img': img,
      };
}
