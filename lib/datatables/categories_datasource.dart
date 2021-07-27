import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/models/category.dart';
import 'package:ssalindemann/providers/categories_provider.dart';
import 'package:ssalindemann/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow? getRow(int index) {
    final categoria = this.categorias[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.id)),
      DataCell(Text(categoria.nombre)),
      DataCell(Text(categoria.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                          categoria: categoria,
                        ));
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('¿Borrar Definitivamente ${categoria.nombre}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                    TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(categoria.id);
                          Navigator.of(context).pop();
                        },
                        child: Text('Si, borrar')),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              }),
        ],
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categorias.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
