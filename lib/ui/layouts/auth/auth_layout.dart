import 'package:flutter/material.dart';
import 'package:ssalindemann/ui/layouts/auth/widgets/background_lindemann.dart';
import 'package:ssalindemann/ui/layouts/auth/widgets/custom_title.dart';
import 'package:ssalindemann/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            (size.width > 1000)
                ? _DesktopBody(child: child)
                : _MobileBody(child: child),
            // LinksBar
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTitle(),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundLindemann(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.94,
      color: Colors.brown[900],
      child: Row(
        children: [
          // Lindemann Background
          BackgroundLindemann(),

          // View container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.brown[900],
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTitle(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: child,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
