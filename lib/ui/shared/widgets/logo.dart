import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_sharp,
            color: Colors.yellow.withOpacity(0.6),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Admin',
            style: GoogleFonts.raleway(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.yellow.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}
