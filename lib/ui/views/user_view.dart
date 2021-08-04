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
class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
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
            'Añadir Estudiante',
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
                initialValue: user.email,
                onChanged: (value) =>
                    userFormProvider.copyUserWith(correo: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo de Usuario',
                    label: 'Correo',
                    icon: Icons.mark_email_read_outlined),
                validator: (value) {
                  if (!EmailValidator.validate(value ?? ''))
                    return 'Usuario o email no valido';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Contraseña',
                    label: 'Contraseña',
                    icon: Icons.block_outlined),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Telefono o Celular',
                    label: 'Telefono o Celular',
                    icon: Icons.phone_android_outlined),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Area', label: 'Area', icon: Icons.apps_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                    hint: 'RUDE', label: 'Rude', icon: Icons.block_outlined),
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
                user.nombres!,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
