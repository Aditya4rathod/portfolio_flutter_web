import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/widgets/common_size.dart';

class CustomSkillWidget extends StatelessWidget {

  final String frameWork;
  final String percentage;
  final double progressValue;

  const CustomSkillWidget({Key? key , required this.frameWork , required this.percentage , required this.progressValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w , vertical: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(frameWork ,  style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.white.withOpacity(0.6),
              ),),
              const Spacer(),
              Text("${percentage}%",  style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.white.withOpacity(0.6),
              ),)
            ],
          ),
          CommonSize(height: 10.h,),
          LinearProgressIndicator(
            backgroundColor: Colors.black.withOpacity(0.2),
            color: AppColors.pinkAccentColor,
            borderRadius: BorderRadius.circular(10.r),
            value: progressValue,
          )
        ],
      ),
    );
  }
}
