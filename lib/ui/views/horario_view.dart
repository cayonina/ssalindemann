import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/api/LindemannApi.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HorarioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    // SE SUPONE QUE ESTO CONECTA CON EL STORAGE
    String downloadURL = "";
    print("URL" + downloadURL);
    Future<void> downloadURLExample() async {
      downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('horario/1A.png')
          .getDownloadURL();
      print("URL DENTROOOO" + downloadURL);
    }

    print("URL AAAA" + downloadURL);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'HORARIO',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(
            child: Column(
              children: [
                // AQUI DEBEN IR SOLO IMAGENES DE LOS HORARIOS
                Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F1B.png?alt=media&token=c436c7e5-e0ed-41c1-b2ef-14710dd1edb0'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
