import 'package:flutter/material.dart';

class BackgroundLindemann extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/canchapor.png?alt=media&token=9ab8a98c-68f2-4837-80ac-986095457204',
                  fit: BoxFit.cover,
                  height: 1500,
                  width: 1500,
                )),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage('canchapor.png'),
      fit: BoxFit.cover,
    ));
  }
}
