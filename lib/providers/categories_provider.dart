import 'package:flutter/material.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/models/category.dart';
import 'package:ssalindemann/models/http/categories_responde.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];
  getCategories() async {
    final resp = await LindemannApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    this.categorias = [...categoriesResponse.categorias];
    print(this.categorias);
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await LindemannApi.post('/categorias', data);
      final newCategori = Categoria.fromMap(json);

      categorias.add(newCategori);
      notifyListeners();
    } catch (e) {
      print(e);
      print('error al crear categoria');
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      await LindemannApi.put('/categorias/$id', data);
      this.categorias = this.categorias.map((category) {
        if (category.id != id) return category;

        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      throw 'error al actualizar categoria';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await LindemannApi.delete('/categorias/$id', {});
      categorias.removeWhere((categoria) => categoria.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
      throw 'error al crear categoria';
    }
  }
}
