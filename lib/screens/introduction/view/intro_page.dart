import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/common_button.dart';
import 'package:portfolio/widgets/common_size.dart';

class IntroductionPage extends StatelessWidget {
  // final VoidCallback onTap;
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSize(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Responsive.isMobile(context)
            ? Column(
                // Column for mobile layout
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfileImage(context),
                  CommonSize(height: 20.h), // Space between elements
                  _buildTextContent(),
                  CommonSize(height: 20.h), // Space between elements
                  // moreAboutMeButton(),
                ],
              )
              : Row(
                  // Row for desktop layout
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextContent(),
                        CommonSize(height: 20.h),
                        // moreAboutMeButton(),
                      ],
                    ),
                    _buildProfileImage(context),
                  ],
                ),
      ),
    );
  }

  // Method to build the profile image widget
  Widget _buildProfileImage(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              spreadRadius: 3.0,
              blurStyle: BlurStyle.outer,
              color: Colors.white.withOpacity(0.2),
            ),
          ],
        ),
        child: ClipOval(
          child: CommonSize(
              height: Responsive.isMobile(context) ? 0.4.sw : 0.3.sw,
              width: Responsive.isMobile(context) ? 0.4.sw : 0.3.sw,
              child: Image.asset(
                AppImages.introPic,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }

  // Method to build the text content widget
  Widget _buildTextContent() {
    return RichText(
      text: TextSpan(
        text: 'Hello\n',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
        children: <TextSpan>[
          TextSpan(
            text: "I'm Aditya Rathod\n",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),
          TextSpan(
            text: "Crafting Code, Designing Futures.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget moreAboutMeButton() {
    return CommonAppButton(onTap: (){}, buttonText: 'Download CV',);
  }

/* Widget _moreAboutMeButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 3,
        foregroundColor: AppColors.backGroundColor,
        backgroundColor: AppColors.backGroundColor.withOpacity(0.2),
      ),
      child:  Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Text("More About Me", style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            // color: Colors.grey.withOpacity(0.9),
            color: AppColors.buttonTextColor,
          ),
        ),
        ),
      ),
    );
  }*/
}
