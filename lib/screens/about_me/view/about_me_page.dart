import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/url_launcher.dart';
import 'package:portfolio/widgets/common_size.dart';
import 'package:portfolio/widgets/custom_social_media_button.dart';

class AboutMeView extends StatelessWidget {
  AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: Responsive.isMobile(context) ? 30.h : 60.h),
      child: Responsive.isMobile(context)
          ? SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
              children: [
                  _aboutMeTitle(),
                  _buildProfileImage(context),
                  CommonSize(height: 20.h), // Space between elements
                  _buildTextContent(),
                ],
              ),
            )
          : Column(
              children: [
                _aboutMeTitle(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(flex: 4, child: _buildProfileImage(context)),
                    Flexible(flex: 6, child: _buildTextContent()),
                  ],
                ),
              ],
            ),
    );
  }

  // Method to build the profile image widget
  Widget _buildProfileImage(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                spreadRadius: 6.0,
                blurStyle: BlurStyle.outer,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),
          child: ClipOval(
            child: CommonSize(
                height: Responsive.isMobile(context) ? 0.50.sw : 0.20.sw, // Width-based height for responsiveness
                width: Responsive.isMobile(context) ? 0.50.sw : 0.20.sw,
                child: Image.asset(
                  AppImages.profilePic,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        CommonSize(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSocialMediaButton(
                logoUrl: AppImages.twitter,
                onTap: () async {
                  await LaunchUrl.redirectToUrl(Uri.parse("https://x.com/AdityaR1404"));
                }),
            CommonSize(
              width: 20.w,
            ),
            CustomSocialMediaButton(
                logoUrl: AppImages.linkdin,
                onTap: () async {
                  await LaunchUrl.redirectToUrl(Uri.parse("https://www.linkedin.com/in/aditya-rathod-371886202/"));
                }),
            CommonSize(
              width: 20.w,
            ),
            CustomSocialMediaButton(
                logoUrl: AppImages.github,
                onTap: () async {
                  await LaunchUrl.redirectToUrl(Uri.parse("https://github.com/Aditya4rathod"));
                }),
          ],
        ),
      ],
    );
  }

  Widget _aboutMeTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'INFO\n',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.pinkAccentColor,
            ),
            children: [
              TextSpan(
                text: "ABOUT ME\n",
                style: GoogleFonts.poppins(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Method to build the text content widget
  Widget _buildTextContent() {
    return RichText(
      text: TextSpan(
        text: "Hi! I'm Aditya Rathod. ",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        children: <TextSpan>[
          TextSpan(
            text: "an Associate Software Engineer with over 2 years of experience at ",
            style: _descStyle,
          ),
          TextSpan(
              text: "Codeline Infotech",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  LaunchUrl.redirectToUrl(Uri.parse("https://www.linkedin.com/company/codeline-infotech-llp/"));
                },
              style: _clickableTextStyle),
          TextSpan(text: " & ", style: _descStyle),
          TextSpan(
              text: "Moon Technolabs",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  LaunchUrl.redirectToUrl(Uri.parse("https://www.linkedin.com/company/moontechnolabs/"));
                },
              style: _clickableTextStyle),
          TextSpan(
            text:
                " I thrive on transforming complex problems into efficient, scalable software, drawing on my deep expertise in Data Structures and Algorithms (DSA). \n\n",
            style: _descStyle,
          ),
          TextSpan(
            text:
                "I’m not just about writing code; I’m about creating impactful experiences that resonate with users and drive success for businesses. Always eager to learn and adapt, I bring fresh perspectives and cutting-edge solutions to every project I take on.",
            style: _descStyle,
          ),
        ],
      ),
    );
  }

  _moreAboutMeButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 3,
        foregroundColor: AppColors.backGroundColor,
        backgroundColor: AppColors.backGroundColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Text(
          "More About Me",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              // color: Colors.grey.withOpacity(0.9),
              color: AppColors.pinkAccentColor,
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle _clickableTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    color: Colors.white.withOpacity(0.9),
  ));

  final TextStyle _descStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white.withOpacity(0.6),
  ));
}
