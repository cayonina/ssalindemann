import 'package:flutter/material.dart';

import 'package:ssalindemann/models/user_model.dart';

import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/providers.dart';

import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/services/notifications_service.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';
import 'package:ssalindemann/ui/layouts/auth/widgets/custom_title.dart';

// ESTA SERA LA VISTA DONDE SE EDITARA LAS NOTAS EN CASO DE PROFESORES Y DONDE PODRA VER LOS ESTUDIANTES PERO CON EL TEXTFORM  DESABILTADO
class NotasView extends StatefulWidget {
  final String uid;
  const NotasView({
    Key? key,
    required this.uid,
    // required this.uid
  }) : super(key: key);

  @override
  _NotasViewState createState() => _NotasViewState();
}

class _NotasViewState extends State<NotasView> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    // final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    // final userFormProvider =
    //     Provider.of<UserFormProvider>(context, listen: false);

    // usersProvider.getUserById(widget.uid).then((userDB) {
    //   if (userDB != null) {
    //     userFormProvider.user = userDB;
    //     userFormProvider.formKey = new GlobalKey<FormState>();
    //     setState(() {
    //       this.user = userDB;
    //     });
    //   } else {
    //     NavigationService.replaceTo('/dashboard/users');
    //   }
    // });
  }

  // @override
  // void dispose() {
  //   this.user = null;
  //   final userFormProvider =
  //       Provider.of<UserFormProvider>(context, listen: false).user = null;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Calificacion del Estudiante',
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
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userFormProvider = Provider.of<UserFormProvider>(context);
    // final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Calificacion Materia de Física',
        child: Form(
          // key: userFormProvider.formKey,
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
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Extamen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Nota Parcial',
                          icon: Icons.access_alarm_outlined,
                          label: 'Nota Parcial',
                          activado: false),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: CustomInputs.formNotasInputDecoration(
                      hint: 'Comentario 1er Trimestre',
                      icon: Icons.access_alarm_outlined,
                      label: 'Comentario 1er Trimestre',
                      activado: true),
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
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Extamen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Nota Parcial',
                          icon: Icons.access_alarm_outlined,
                          label: 'Nota Parcial',
                          activado: false),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 2do Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 2do Trimestre',
                    activado: true),
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
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Preliminar',
                        icon: Icons.access_alarm_outlined,
                        label: 'Preliminar',
                        activado: true),
                  )),
                  Flexible(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Examen Final',
                        icon: Icons.access_alarm_outlined,
                        label: 'Examen Final',
                        activado: true),
                  )),
                  Flexible(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Nota Parcial',
                        icon: Icons.access_alarm_outlined,
                        label: 'Nota Parcial',
                        activado: false),
                  )),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 3er Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 3er Trimestre',
                    activado: true),
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
                      // postear, actualizar usuario
                      // final saved = await userFormProvider.updateUser();
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
