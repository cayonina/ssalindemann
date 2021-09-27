import 'package:flutter/material.dart';
import 'package:ssalindemann/models/estudiante_model.dart';

import 'package:ssalindemann/models/user_model.dart';

import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/estudiante_notas_provider.dart';
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
  final String uidEstudiante;
  final String nombreMateria;

  const NotasView({
    Key? key,
    required this.uidEstudiante,
    required this.nombreMateria,
  }) : super(key: key);

  @override
  _NotasViewState createState() => _NotasViewState();
}

class _NotasViewState extends State<NotasView> {
  Notes? user;

  @override
  void initState() {
    //   super.initState();
    //   // AQUI ENLAZAR CON LOS PROVIDER
    //   final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    //   final userFormProvider =
    //       Provider.of<UserFormProvider>(context, listen: false);

    //   usersProvider.getPaginatedNotasbyId(widget.uid!).then((userDB) {
    //     if (userDB != null) {
    //       userFormProvider.estudianteNota = userDB;
    //       userFormProvider.formKey = new GlobalKey<FormState>();
    //       setState(() {
    //         this.user = userDB;
    //       });
    //     } else {
    //       print('==== ENTRA AQUI ===== REDIRECCIONA A USERS ===');
    //       NavigationService.replaceTo('/dashboard/users');
    //     }
    //   });
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((duration) {
      final provider =
          Provider.of<EstudianteNotasProvider>(context, listen: false);
      provider.init(
        idEstu: widget.uidEstudiante,
        nombreMat: widget.nombreMateria,
      );
    });
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
    final provider = Provider.of<EstudianteNotasProvider>(context);

    // return Text(provider.loading ? 'true' : 'false');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: provider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Text(
                  'Calificacion materia idEst ${widget.uidEstudiante} mate ${widget.nombreMateria}',
                  style: CustomLabels.h1,
                ),
                SizedBox(
                  height: 10,
                ),
                // if (user == null)
                // WhiteCard(
                //   child: Column(
                //     children: [
                _UserViewForm(),
                //     ],
                //     // child: CircularProgressIndicator(),
                //   ),
                // ),
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EstudianteNotasProvider>(
      context,
      listen: false,
    );
    // final userFormProvider = Provider.of<UserFormProvider>(context);
    // final estudianteNota = userFormProvider.estudianteNota ?? Notes.fromEmpty();
    return WhiteCard(
        title: 'Boletin de Notas',
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              // INI PRIMER TRIMESTRE
              SizedBox(height: 20),
              Text('Notas del Primer Trimestre', style: CustomLabels.h3),
              SizedBox(height: 20),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: provider.notes.notesOne[0].toString(),
                        decoration: CustomInputs.formNotasInputDecoration(
                            hint: 'Preliminar',
                            icon: Icons.access_alarm_outlined,
                            label: 'Preliminar',
                            activado: true),
                        onChanged: (value) {
                          double nota = double.parse(value);
                          provider.notes.notesOne[0] = nota;
                          // provider.updateUI();
                        },
                      ),
                    ),
                    Flexible(child: SizedBox(width: 10)),
                    Expanded(
                      child: TextFormField(
                        initialValue: provider.notes.notesOne[1].toString(),
                        decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Extamen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true,
                        ),
                        onChanged: (value) {
                          double nota = double.parse(value);
                          provider.notes.notesOne[1] = nota;
                          // provider.updateUI();
                        },
                      ),
                    ),
                    Flexible(child: SizedBox(width: 10)),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${provider.notes.getNotaParcial1()}',
                        decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Nota Parcial',
                          icon: Icons.access_alarm_outlined,
                          label: 'Nota Parcial',
                          activado: false,
                        ),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: provider.notes.commentOne,
                  decoration: CustomInputs.formNotasInputDecoration(
                      hint: 'Comentario 1er Trimestre',
                      icon: Icons.access_alarm_outlined,
                      label: 'Comentario 1er Trimestre',
                      activado: true),
                  onChanged: (value) {
                    provider.notes.commentOne = value;
                  },
                ),
              ]),
              // END PRIMER TRIMESTRE

              // INI SEGUNDO TRIMESTRE
              SizedBox(height: 20),
              Text('Notas del Segundo Trimestre', style: CustomLabels.h3),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormField(
                      initialValue: provider.notes.notesTwo[0].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        provider.notes.notesTwo[0] = nota;
                        // provider.updateUI();
                      },
                    )),
                    Flexible(child: SizedBox(width: 10)),
                    Expanded(
                        child: TextFormField(
                      initialValue: provider.notes.notesTwo[1].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Examen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        provider.notes.notesTwo[1] = nota;
                        // provider.updateUI();
                      },
                    )),
                    Flexible(child: SizedBox(width: 10)),
                    Expanded(
                        child: TextFormField(
                      initialValue: '${provider.notes.getNotaParcial2()}',
                      decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Nota Parcial',
                        icon: Icons.access_alarm_outlined,
                        label: 'Nota Parcial',
                        activado: false,
                      ),
                      readOnly: true,
                    )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: provider.notes.commentTwo,
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 2do Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 2do Trimestre',
                    activado: true),
                onChanged: (value) {
                  provider.notes.commentTwo = value;
                },
              ),
              // END SEGUNDO TRIMESTRE

              // INI TERCER TRIMESTRE
              SizedBox(height: 20),
              Text('Notas del Tercer Trimestre', style: CustomLabels.h3),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextFormField(
                      initialValue: provider.notes.notesThree[0].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Preliminar',
                          icon: Icons.access_alarm_outlined,
                          label: 'Preliminar',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        provider.notes.notesThree[0] = nota;
                        // provider.updateUI();
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: provider.notes.notesThree[1].toString(),
                      decoration: CustomInputs.formNotasInputDecoration(
                          hint: 'Examen Final',
                          icon: Icons.access_alarm_outlined,
                          label: 'Examen Final',
                          activado: true),
                      onChanged: (value) {
                        double nota = double.parse(value);
                        provider.notes.notesThree[1] = nota;
                        // provider.updateUI();
                      },
                    )),
                    Flexible(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                      initialValue: '${provider.notes.getNotaParcial3()}',
                      decoration: CustomInputs.formNotasInputDecoration(
                        hint: 'Nota Parcial',
                        icon: Icons.access_alarm_outlined,
                        label: 'Nota Parcial',
                        activado: false,
                      ),
                      readOnly: true,
                    )),
                  ],
                ),
              ),
              SizedBox(height: 35),
              TextFormField(
                initialValue: provider.notes.commentThree,
                decoration: CustomInputs.formNotasInputDecoration(
                    hint: 'Comentario 3er Trimestre',
                    icon: Icons.access_alarm_outlined,
                    label: 'Comentario 3er Trimestre',
                    activado: true),
                onChanged: (value) {
                  provider.notes.commentThree = value;
                },
              ),
              // END TERCER TRIMESTRE

              SizedBox(height: 35),
              Text(
                // TODO: VERIFICAR ESTA OPERACION
                'Nota Final: ${provider.notes.getNotaFinal().toStringAsFixed(2)}',
                style: CustomLabels.h3,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  provider.updateUI();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                label: Text('calcular'),
                icon: Icon(Icons.update, size: 20),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 110),
                child: ElevatedButton(
                  onPressed: () async {
                    // Guardar la nota escrita
                    // AQUI SE DEBE CREAR LA NOTA SOLO SI ES PRIMERA VEZ LUEGO YA ACTUALIZAR
                    final saved = await provider.updateNota();
                    if (saved) {
                      NotificationsService.showSnackbar('Usuario Actualizado');
                    } else {
                      NotificationsService.showSnackbarError('Error!');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.brown[900]),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.save_outlined, size: 20),
                      Text(' Guardar')
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
