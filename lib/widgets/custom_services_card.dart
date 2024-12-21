import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/widgets/common_size.dart';

class ServicesCard extends StatefulWidget {
  final IconData iconData;
  final String label;
  final String desc;

  const ServicesCard({Key? key, required this.iconData, required this.label, required this.desc}) : super(key: key);

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: AppColors.backGroundColor,
      height: 350.h,
      width: 350.w,
      borderRadius: 10.r,
      depth: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
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
                height: 60,
                width: 60,
                borderRadius: 30,
                emboss: isHover ? true : false,
                depth: 8,
                child: Icon(
                  widget.iconData,
                  size: 30,
                  color: isHover ? AppColors.pinkAccentColor : Colors.white,
                ),
              ),
            ),
            CommonSize(
              height: 10.h,
            ),
            Text(
              widget.label,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.white)),
            ),
            CommonSize(
              height: 10.h,
            ),
            Text(
              widget.desc,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white.withOpacity(0.7))),
            ),
          ],
        ),
      ),
    );
  }
}
