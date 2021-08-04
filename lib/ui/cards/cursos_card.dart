import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssalindemann/ui/buttons/custom_outlined_button.dart';

class CursosCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final Color color;
  final VoidCallback? onPressed;
  const CursosCard(
      {Key? key,
      this.title,
      required this.child,
      this.width,
      required this.color,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width != null ? width : null,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: buildBoxDecoration(color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title!,
                  style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(),
            ],
            child,
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(Color color) => BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)
          ]);
}
