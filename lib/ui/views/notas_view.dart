import 'package:flutter/material.dart';
import 'package:ssalindemann/models/estudiante_model.dart';

import 'package:ssalindemann/models/user_model.dart';

import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/providers.dart';

import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/services/notifications_service.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';
import 'package:ssalindemann/ui/layouts/auth/widgets/custom_title.dart';

// ESTA SERA LA VISTA DONDE SE EDITARA LAS NOTAS EN CASO DE PROFESORES Y DONDE
// PODRA VER LOS ESTUDIANTES PERO CON EL TEXTFORM  DESABILTADO
class NotasView extends StatefulWidget {
  final String? uid;
  // final String? materia;
  const NotasView({
    Key? key,
    required this.uid,
    // this.materia,
    // required this.uid
  }) : super(key: key);

  @override
  _NotasViewState createState() => _NotasViewState();
}

class _NotasViewState extends State<NotasView> {
  Notes? user;

  @override
  void initState() {
    super.initState();
    // AQUI ENLAZAR CON LOS PROVIDER
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    print(widget.uid! + 'ESTE ID ESTA OBTENIENDOOO');
    usersProvider.getPaginatedNotasbyId(widget.uid!).then((userDB) {
      print(userDB);
      userFormProvider.formKey = new GlobalKey<FormState>();
      if (userDB != null) {
        userFormProvider.estudianteNota = userDB;
        setState(() {
          this.user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    this.user = null;
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Calificacion materia ',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          // if (user == null)
          WhiteCard(
            child: Column(
              children: [
                _UserViewForm(),
              ],
              // child: CircularProgressIndicator(),
            ),
          ),
          // if (user != null)

          // Text('${user?.nombres}')
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  _UserViewForm({
    Key? key,
  }) : super(key: key);

  final notas1 = List.filled(3, 0.0);
  final notas2 = List.filled(3, 0.0);
  final notas3 = List.filled(3, 0.0);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final estudianteNota = userFormProvider.estudianteNota ?? Notes.fromEmpty();
    return WhiteCard(
        title: 'Boletin de Notas' + estudianteNota.materia!,
        child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Notas del Primer Trimestre',
                style: CustomLabels.h3,
              ),
              SizedBox(
                height: 20,
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesOne[0].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas1.add(nota);
                        userFormProvider.copyEstudianteNotaWith(
                            notesOne: notas1);
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesOne[1].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Extamen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas1.add(nota);
                        userFormProvider.copyEstudianteNotaWith(
                            notesOne: notas1);
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesOne[2].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Nota Parcial',
                          icon: Icons.access_alarm_outlined,
                          label: 'Nota Parcial',
                          activado: false),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas1.add(notas1.elementAt(0) + notas1.elementAt(1));
                        userFormProvider.copyEstudianteNotaWith(
                            notesOne: notas1);
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: estudianteNota.commentOne,
                  decoration: CustomInputs.formNotasInputDecoration(
                      hint: 'Comentario 1er Trimestre',
                      icon: Icons.access_alarm_outlined,
                      label: 'Comentario 1er Trimestre',
                      activado: true),
                  onChanged: (value) {
                    userFormProvider.copyEstudianteNotaWith(commentOne: value);
                  },
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                'Notas del Segundo Trimestre',
                style: CustomLabels.h3,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesTwo[0].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas2.add(nota);
                        userFormProvider.copyEstudianteNotaWith(
                            notesTwo: notas2);
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesTwo[1].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Extamen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas2.add(nota);
                        userFormProvider.copyEstudianteNotaWith(
                            notesTwo: notas2);
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: estudianteNota.notesTwo[2].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Nota Parcial',
                          icon: Icons.access_alarm_outlined,
                          label: 'Nota Parcial',
                          activado: false),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        notas2.add(notas2.elementAt(0) + notas2.elementAt(1));
                        userFormProvider.copyEstudianteNotaWith(
                            notesTwo: notas2);
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: estudianteNota.commentTwo,
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 2do Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 2do Trimestre',
                    activado: true),
                onChanged: (value) {
                  userFormProvider.copyEstudianteNotaWith(commentTwo: value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Notas del Tercer Trimestre',
                style: CustomLabels.h3,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextFormField(
                    initialValue: estudianteNota.notesThree[0].toString(),
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Preliminar',
                        icon: Icons.access_alarm_outlined,
                        label: 'Preliminar',
                        activado: true),
                    onChanged: (value) {
                      double nota = double.parse(value);
                      notas3.add(nota);
                      userFormProvider.copyEstudianteNotaWith(
                          notesThree: notas3);
                    },
                  )),
                  Flexible(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    initialValue: estudianteNota.notesThree[1].toString(),
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Examen Final',
                        icon: Icons.access_alarm_outlined,
                        label: 'Examen Final',
                        activado: true),
                    onChanged: (value) {
                      double nota = double.parse(value);
                      notas3.add(nota);
                      userFormProvider.copyEstudianteNotaWith(
                          notesThree: notas3);
                    },
                  )),
                  Flexible(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    initialValue: estudianteNota.notesThree[2].toString(),
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Nota Parcial',
                        icon: Icons.access_alarm_outlined,
                        label: 'Nota Parcial',
                        activado: false),
                    onChanged: (value) {
                      double nota = double.parse(value);
                      notas3.add(notas3.elementAt(0) + notas3.elementAt(1));
                      userFormProvider.copyEstudianteNotaWith(
                          notesThree: notas3);
                    },
                  )),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                initialValue: estudianteNota.commentThree,
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 3er Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 3er Trimestre',
                    activado: true),
                onChanged: (value) {
                  userFormProvider.copyEstudianteNotaWith(commentThree: value);
                },
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                // esto debe modificarse del promedio de las notas finals de cada trimestre
                'Nota Final: 51',
                style: CustomLabels.h3,
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100),
                child: ElevatedButton(
                    onPressed: () async {
                      // Guardar la nota escrita
                      // AQUI SE DEBE CREAR LA NOTA SOLO SI ES PRIMERA VEZ LUEGO YA ACTUALIZAR
                      // final saved = await userFormProvider.createNotaEstudiante();
                      // if (saved) {
                      //   NotificationsService.showSnackbar(
                      //       'Usuario Actualizado');
                      //   Provider.of<UsersProvider>(context, listen: false)
                      //       .refreshUser(user);
                      //   // actualizar usuarios??
                      // } else {
                      //   NotificationsService.showSnackbarError(
                      //       'No se pudo guardar');
                      // }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.brown[900]),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: Row(children: [
                      Icon(
                        Icons.save_outlined,
                        size: 20,
                      ),
                      Text(' Guardar')
                    ])),
              )
            ],
          ),
        ));
  }
}
