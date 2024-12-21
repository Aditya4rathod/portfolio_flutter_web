import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/dashboard/view/dashboard_view.dart';
import 'package:portfolio/screens/my_projects/view/my_project_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Portfolio',
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(Typography.englishLike2018.apply(fontSizeFactor: 1.sp)),
          ),
          home: child,
        );
      },
      child: const DashboardView(),
    );
  }
}
