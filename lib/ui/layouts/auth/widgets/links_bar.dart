import 'package:flutter/material.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/services/navigation_services.dart';
import 'package:ssalindemann/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.brown[900],
      height: (size.width > 1000) ? size.height * 0.07 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'Acerca de',
            onPressed: () {
              NavigationService.replaceTo(Flurorouter.aboutRoute);
            },
          ),
          // LinkText(text: 'Ayuda'),
          // LinkText(text: 'Facebook'),
          // LinkText(text: 'Youtube'),
          // LinkText(text: 'Blog'),
          // LinkText(text: 'About'),
          // LinkText(text: 'Aviso'),
        ],
      ),
    );
  }
}
