import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/category.dart';
import 'package:ssalindemann/providers/categories_provider.dart';
import 'package:ssalindemann/services/notifications_service.dart';
import 'package:ssalindemann/ui/buttons/custom_outlined_button.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;

  CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva Categoria',
                style: CustomLabels.h1
                    .copyWith(color: Colors.yellow.withOpacity(0.6)),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.yellow.withOpacity(0.8),
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Materia: Lenguaje y Comunicaciones',
                label: 'Materia: Lenguaje y Comunicaciones',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                print(nombre);
                try {
                  if (id == null) {
                    // crear
                    await categoryProvider.newCategory(nombre);
                    NotificationsService.showSnackbar('$nombre creado');
                  } else {
                    // actualizar
                    await categoryProvider.updateCategory(id!, nombre);
                    NotificationsService.showSnackbar('$nombre actualizado');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbar(
                      'No se pudo guardar la categoria');
                }
              },
              text: 'Guardar Calificación',
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Colors.brown.shade900,
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
