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
class PerfilView extends StatefulWidget {
  // ESTE ID ES DEL QUE ESTA EN SESION
  final String? uid;

  const PerfilView({Key? key, this.uid}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  UserModel? user;
  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    // }REMPLAZAR EL ID QUE ESTA EN SESION
    usersProvider
        .getUserById(widget.uid ?? '0hZmmf9aaU02kfqOCEmK')
        .then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = new GlobalKey<FormState>();
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
            'Mi Perfil',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: CircularProgressIndicator(),
              ),
            ),
          if (user != null) _userViewBody(),
          Text('${user?.nombres}')
        ],
      ),
    );
  }
}

class _userViewBody extends StatelessWidget {
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
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información del Estudiante',
        child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                initialValue: user.nombres,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre de Estudiante',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined),
                onChanged: (value) =>
                    userFormProvider.copyUserWith(nombres: value),
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
                initialValue: user.apellidos,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(apellidos: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Apellidos del Estudiante',
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
                initialValue: user.email,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(correo: value),
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
                initialValue: user.password,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(password: value),
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
                initialValue: user.edad.toString(),
                onChanged: (value) =>
                    userFormProvider.copyUserWith(edad: int.parse(value)),
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
                initialValue: user.celular,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(celular: value),
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
                initialValue: user.direccion,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(direccion: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Direccion de su casa',
                    label: 'Direccion',
                    icon: Icons.map_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese una direccion de referencia';
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
                      final saved = await userFormProvider.updateUser();
                      if (saved) {
                        NotificationsService.showSnackbar(
                            'Usuario Actualizado');
                        Provider.of<UsersProvider>(context, listen: false)
                            .refreshUser(user);
                        // actualizar usuarios??
                      } else {
                        NotificationsService.showSnackbarError(
                            'No se pudo guardar');
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
    final user = userFormProvider.user!;
    final image = (user.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);
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

                            if (result != null) {
                              PlatformFile file = result.files.first;
                              NotificationsService.showBusyIndicator(context);
                              final url = await userFormProvider.uploadImage(
                                user.id!,
                                file.name,
                                file.bytes!,
                              );

                              if (url.isNotEmpty) {
                                Provider.of<UserFormProvider>(
                                  context,
                                  listen: false,
                                ).copyUserWith(img: url);
                              }
                              Navigator.of(context).pop();
                            } else {
                              // User canceled the picker
                            }
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
                user.nombres!,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
