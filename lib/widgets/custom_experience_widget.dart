import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/url_launcher.dart';
import 'package:portfolio/widgets/common_size.dart';

class CustomExperienceCard extends StatelessWidget {
  final bool isLeftAligned;
  final String logo;
  final String title;
  final String? titleUrl;
  final String subTitle;
  final String duration;
  final String desc;

  const CustomExperienceCard(
      {Key? key,
      required this.isLeftAligned,
      required this.logo,
      required this.title,
      required this.subTitle,
      required this.duration,
      required this.desc,
      this.titleUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return ClayContainer(
      color: AppColors.backGroundColor,
      height: 800.h,
      width: 350.w,
      borderRadius: 10.r,
      depth: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: isDesktop ? 20.w : 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: isLeftAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Image.asset(
              fit: BoxFit.cover,
              height: 30.h,
              width: 30.h,
              logo,
            ),
            CommonSize(
              height: 15.h,
            ),
            titleUrl != null && titleUrl!.isNotEmpty
                ? InkWell(
                    onTap: () {
                      LaunchUrl.redirectToUrl(Uri.parse(titleUrl!));
                    },
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp,
                          color: AppColors.pinkAccentColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.sp,
                        color: AppColors.pinkAccentColor,
                      ),
                    ),
                  ),
            CommonSize(
              height: 10.h,
            ),
            Text(
              subTitle,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white)),
            ),
            Text(
              duration,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white)),
            ),
            CommonSize(
              height: 10.h,
            ),
            Flexible(
              child: Text(
                desc,
                textAlign: isLeftAligned ? TextAlign.end : TextAlign.start,
                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp, color: Colors.white.withOpacity(0.7))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
