import 'package:flutter/material.dart';

class BackgroundLindemann extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: buildBackgroundImage(),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            // child: Image(
            //   image: AssetImage('logosf.png'),
            //   width: 280,
            // ),
          ),
        ),
      ),
    ));
  }

  BoxDecoration buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage('canchapor.png'),
      fit: BoxFit.cover,
    ));
  }
}
