import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/user_model.dart';
import 'package:ssalindemann/providers/user_form_provider.dart';
import 'package:ssalindemann/providers/users_provider.dart';
import 'package:ssalindemann/services/navigation_services.dart';

import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

class CalificacionesView extends StatefulWidget {
  // AQUI SE MOSTRARA UNA LISTA DE LOS CURSOS AL HACER CLIK EN ESTRELLA IRA A LA LISTA DEL CURSO SELECCIONADO Y ESTARA LA CALIFICACION
  final String uid;

  const CalificacionesView({Key? key, required this.uid}) : super(key: key);
  @override
  _CalificacionesViewState createState() => _CalificacionesViewState();
}

class _CalificacionesViewState extends State<CalificacionesView> {
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

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Calificaciones View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(
              title: 'Sales statistics',
              child: Text('Hola Mundo' + user!.apellidos!))
        ],
      ),
    );
  }
}
