import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/views/about_view.dart';

class AboutHandlers {
  static Handler about = new Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrenPageUrl(Flurorouter.aboutRoute);
    return AboutView();
  });
}
