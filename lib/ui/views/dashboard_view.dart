import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/ui/cards/white_cards.dart';
import 'package:ssalindemann/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Inicio',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(
              title: 'Bienvenido ' + user.nombres! + " " + user.apellidos!,
              child: Container(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/canchapor.png?alt=media&token=9ab8a98c-68f2-4837-80ac-986095457204'),
              )),
        ],
      ),
    );
  }
}
