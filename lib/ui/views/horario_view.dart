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
            'Horarios 2021',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              // AQUI DEBEN IR SOLO IMAGENES DE LOS HORARIOS

              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F1A.png?alt=media&token=569a2d4b-4deb-47c8-9e57-f68ee5723b48',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F1B.png?alt=media&token=c436c7e5-e0ed-41c1-b2ef-14710dd1edb0',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F1C.png?alt=media&token=7e79098b-f8e9-49f4-a98d-27c9b1ee175b',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F1D.png?alt=media&token=b3e9e884-fe55-4fb9-b967-badac3b95f16',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F2A.png?alt=media&token=f0ba81ba-6e8b-462c-a151-3fe035166394',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F2B.png?alt=media&token=718afc7e-0bd8-4b72-84b1-1cd55f4557cb',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F2C.png?alt=media&token=fa21e993-d666-4ff1-be4f-9aa200763609',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F2D.png?alt=media&token=48cd78c7-7732-4399-907a-d9e20ac92c82',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F2E.png?alt=media&token=fa3fc48c-29e9-4ab9-81ea-22b4aa491f1f',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F3A.png?alt=media&token=c0283526-fff0-4882-b154-bf68face1244',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F3B.png?alt=media&token=6ef85f44-45e8-499a-90d2-8831431aa705',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F3C.png?alt=media&token=5da428aa-5ee5-4e70-8f37-a7670c961b8b',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F3D.png?alt=media&token=c3d01a21-4972-42c2-9915-866050da4908',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F3E.png?alt=media&token=bc8725eb-3879-43a3-b8fe-f9e7b1a4d084',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F4A.png?alt=media&token=955f60ff-3773-4132-bd0d-392df4ba6a84',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F4B.png?alt=media&token=8a2301ad-f915-4ef5-9067-7de6ca1d1668',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F4C.png?alt=media&token=04c1934a-ecbb-44b9-8796-a7396fa572a9',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F4D.png?alt=media&token=775c2bed-3765-47a4-aa94-f3da7b3a3713',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F4E.png?alt=media&token=acec2b97-07c5-4046-805f-957519763b03',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F5A.png?alt=media&token=7f581b61-89ef-4987-adac-1b6d708ef506',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F5B.png?alt=media&token=b6109943-65af-4ea5-8819-59372bd67305',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F5C.png?alt=media&token=99458aa9-2a69-46de-bab5-1ca9fc3baab0',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F5D.png?alt=media&token=faaf7799-29fd-4637-860a-4db87caaa659',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F5E.png?alt=media&token=8d0ff6ae-ff3a-4a6a-b9a1-d66ee27e5a30',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F6A.png?alt=media&token=ea256035-52bb-4f4b-b3ab-09065031c967',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F6B.png?alt=media&token=8278e1dd-f54e-49b4-aada-93e4d50759c7',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F6C.png?alt=media&token=b1c19bc0-d2fe-4f3d-9a83-fd95b83d1590',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F6D.png?alt=media&token=5900e6ae-7ba4-489a-b43b-14e36e8ff83b',
                width: 820,
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/horario%2F6E.png?alt=media&token=5afb4016-d91f-417e-9cd3-7a45548cfb8b',
                width: 820,
                height: 350,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
