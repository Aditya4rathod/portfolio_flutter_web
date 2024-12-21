import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app/app_colors.dart';

class CommonAppButton extends StatefulWidget {

  const CommonAppButton({Key? key , required this.buttonText, required this.onTap}) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  State<CommonAppButton> createState() => _CommonAppButtonState();
}

class _CommonAppButtonState extends State<CommonAppButton> {


  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.backGroundColor,
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (enter){
          setState(() {
            isHover = true;
          });
        },
        onExit: (exit){
          setState(() {
            isHover = false;
          });
        },
        child: ClayContainer(
            color: AppColors.backGroundColor,
            height: 50.h,
            width: 200.w,
            borderRadius: 25.r,
            depth: 8,
            emboss: isHover ? true : false,
            child: Center(
                child: Text(
                 widget.buttonText,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.pinkAccentColor,
                  ),
                ))),
      ),
    );
  }
}
