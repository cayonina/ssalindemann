import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = new Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrenPageUrl('/404');
    return NoPageFoundView();
  });
}
