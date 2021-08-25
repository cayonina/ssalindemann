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
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/database-lindemann.appspot.com/o/logosf.png?alt=media&token=4abf2ef9-0684-4457-bca2-6ef20dc30138',
              width: 200,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
