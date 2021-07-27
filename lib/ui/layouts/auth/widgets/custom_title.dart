import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'S.S.A. Enrique Lindemann "B"',
              style: GoogleFonts.raleway(
                fontSize: 60,
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.asset(
              'logosf.png',
              width: 200,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
