import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ssalindemann/models/user_model.dart';

import 'package:ssalindemann/models/usuario.dart';

import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/providers.dart';

import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/services/notifications_service.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

// esta es la base de una nueva vista del panel administrativo
class NuevoProfView extends StatefulWidget {
  const NuevoProfView({Key? key}) : super(key: key);

  @override
  _NuevoProfViewState createState() => _NuevoProfViewState();
}

class _NuevoProfViewState extends State<NuevoProfView> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    final profesorProvider =
        Provider.of<ProfesorProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    userFormProvider.formKey = new GlobalKey<FormState>();
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
            'Datos del Profesor',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          // if (user == null)
          //   WhiteCard(
          //     child: Container(
          //       alignment: Alignment.center,
          //       height: 300,
          //       child: CircularProgressIndicator(),
          //     ),
          //   ),
          _profViewBody(),
          Text('${user?.nombres}')
        ],
      ),
    );
  }
}

class _profViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(250),
        },
        //  hacer ancho de la columna
        children: [
          TableRow(children: [
            // hacer avatar
            _AvatarContainer(),
            // formulario actualizacion
            _UserViewForm(),
          ])
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
    final userFormProvider = Provider.of<UserFormProvider>(context);
    // final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información del Profesor',
        child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del Profesor',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined),
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(nombres: value),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese un nombre';
                  if (value.length < 2)
                    return 'Nombre debe de ser mas de dos caracteres';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(apellidos: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Apellidos del Profesor',
                    label: 'Apellidos',
                    icon: Icons.supervised_user_circle_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese un apellido';
                  if (value.length < 2)
                    return 'Apellido debe de ser mas de dos caracteres';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(correo: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo de Usuario',
                    label: 'Correo',
                    icon: Icons.mark_email_read_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese un correo usuario';
                  if (value.length < 2)
                    return 'usuario debe de ser mas de dos caracteres ';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(password: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Contraseña',
                    label: 'Contraseña',
                    icon: Icons.lock_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese una contraseña';
                  if (value.length < 6)
                    return 'contraseña debe ser mas de 6 caracteres';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(edad: int.parse(value)),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Edad',
                    label: 'Edad',
                    icon: Icons.calendar_today_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese su edad';
                  if (value.length < 2)
                    return 'Su edad es tiene mas de 2 digitos';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(celular: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Telefono o Celular',
                    label: 'Celular',
                    icon: Icons.phone_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese un numero de celular propio o de referencia';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWithCreate(area: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Area',
                    label: 'Area',
                    icon: Icons.bookmark_border_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese su Area de especialidad';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) => userFormProvider.copyUserWithCreate(
                    horario_atencion: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Horario de Atencion',
                    label: 'Horario de Atencion',
                    icon: Icons.timelapse_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese su Horario de Atención';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                items: <String>['1A', '1B', '1C', '1D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'CI',
                    label: 'CI',
                    icon: Icons.perm_identity_outlined),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100),
                child: ElevatedButton(
                    onPressed: () async {
                      // postear, actualizar usuario
                      userFormProvider.copyUserWithCreate(rol: "Profesor");
                      final saved = await userFormProvider.createProfesor();
                      if (saved) {
                        NotificationsService.showSnackbar('Profesor Creado');
                        // Provider.of<UsersProvider>(context, listen: false)
                        //     .refreshUser(user);
                        // actualizar usuarios??
                      } else {
                        NotificationsService.showSnackbarError(
                            'No se pudo crear');
                      }
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

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;
    final image = Image(image: AssetImage('no-image.jpg'));

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    ClipOval(child: image),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 5),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.brown[700],
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                          ),
                          onPressed: () async {
                            // seleccionar imagen
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'jpeg', 'png'],
                              allowMultiple: false,
                            );

                            // if (result != null) {
                            //   // PlatformFile file = result.files.first;
                            //   NotificationsService.showBusyIndicator(context);
                            //   final newUser =
                            //       await userFormProvider.uploadImage(
                            //           '/uploads/usuarios/${user.id}',
                            //           result.files.first.bytes!);

                            //   Provider.of<UsersProvider>(context, listen: false)
                            //       .refreshUser(newUser);
                            //   Navigator.of(context).pop();
                            // } else {
                            //   // User canceled the picker
                            // }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                user?.nombres ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
