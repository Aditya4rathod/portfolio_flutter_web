import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, required this.mobile,required this.tablet,required this.desktop,});
  final Widget  mobile;
  final Widget desktop;
  final Widget? tablet;

  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  }

  static bool isDesktop(BuildContext context){
    return MediaQuery.sizeOf(context).width >= 1024;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 600 && size.width < 1024 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
