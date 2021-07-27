import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/datatables/categories_datasource.dart';
import 'package:ssalindemann/providers/categories_provider.dart';

import 'package:ssalindemann/ui/buttons/custom_icon_button.dart';
import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';
import 'package:ssalindemann/ui/modals/category_modal.dart';

// esta es la base de una nueva vista del panel administrativo
class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            // 'Categorias View',
            'Estudiantes',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Curso')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(categorias, context),
            header: Text(
              // 'Categoria A',
              'Estudiantes',
              maxLines: 2,
            ),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => CategoryModal(
                              categoria: null,
                            ));
                  },
                  text: 'Crear nuevo Estudiante',
                  icon: Icons.add_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
