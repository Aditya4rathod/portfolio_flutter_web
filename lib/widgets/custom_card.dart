import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/widgets/common_size.dart';

class CustomCard extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String desc;

  const CustomCard({Key? key, required this.iconData, required this.label, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: AppColors.backGroundColor,
      height: 150.h,
      width: 350.w,
      borderRadius: 10.r,
      depth: 10,
      child: Column(
        children: [
          Container(
            height: 8.h, // Responsive height
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r), // Responsive radius
                topRight: Radius.circular(10.r),
              ),
              color: AppColors.pinkAccentColor,
            ),
          ),
          CommonSize(
            height: 20.h,
          ),
          Icon(
            iconData,
            color: AppColors.pinkAccentColor,
            size: 30,
            weight: 12,
          ),
          CommonSize(
            height: 10.h,
          ),
          Text(
            label,
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.white)),
          ),
          CommonSize(
            height: 10.h,
          ),
          Text(
            desc,
            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white.withOpacity(0.7))),
          ),
        ],
      ),
    );
  }
}
