import 'package:flutter/material.dart';
import 'package:ssalindemann/providers/sidemenu_provider.dart';
import 'package:ssalindemann/ui/shared/navbar.dart';
import 'package:ssalindemann/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              // dependi si es mas de 700px

              if (size.width >= 700) Sidebar(),

              Expanded(
                child: Column(
                  children: [
                    // NavBar
                    Navbar(),
                    // View
                    Expanded(
                        child: Container(
                      child: widget.child,
                    )),
                  ],
                ),
              )
              // contenedor del view
            ],
          ),
          // aqui sobrepone el menu hamburguesa
          if (size.width < 700)
            AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        // todo background del sidebar
                        if (SideMenuProvider.isOpen)
                          Opacity(
                            opacity: SideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        Transform.translate(
                            offset: Offset(SideMenuProvider.movement.value, 0),
                            child: Sidebar()),
                      ],
                    ))
        ],
      ),
    );
  }
}
