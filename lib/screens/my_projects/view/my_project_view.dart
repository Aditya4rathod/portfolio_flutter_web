import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/models/my_work_model.dart';
import 'package:portfolio/utils/url_launcher.dart';
import 'package:portfolio/widgets/custom_work_card.dart';

class MyProjectView extends StatelessWidget {
  MyProjectView({Key? key}) : super(key: key);

  final List<MyWorkModel> myWork = [
    MyWorkModel(
      label: 'Moon HRM: HR & Employee Portal',
      frameWork: "Flutter, Swift",
      images: [
        ImageData(
          myWorkImg: 'assets/images/playstore.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.moontechnolabs.moonhrm&pcampaignid=web_share',
            ));
          },
        ),
        ImageData(
          myWorkImg: AppImages.microSoft,
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://www.microsoft.com/store/productId/9NKP3965642G?ocid=pdpshare',
            ));
          },
        ),
        ImageData(
          myWorkImg: 'assets/images/app-store.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://apps.apple.com/us/app/moon-hrm-hr-employee-portal/id6467123307',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Mahindra One',
      frameWork: "Flutter, Firebase",
      images: [
        ImageData(
          myWorkImg: 'assets/images/playstore.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.mahindra.m1supperapp&hl=en_IN',
            ));
          },
        ),
        ImageData(
          myWorkImg: 'assets/images/app-store.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.mahindra.m1supperapp&hl=en_IN',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Executive Matchmaker - LUMA',
      images: [
        ImageData(
          myWorkImg: 'assets/images/app-store.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://apps.apple.com/us/app/executive-matchmaker-luma/id1198665627',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Instacure Doctor',
      images: [
        ImageData(
          myWorkImg: 'assets/images/playstore.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.instacure.doctor&hl=en_IN',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Cyber Shop',
      images: [
        ImageData(
          myWorkImg: 'assets/images/playstore.png',
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://github.com/Aditya4rathod/CyberShop',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Little Lost',
      frameWork: 'JavaScript',
      images: [
        ImageData(
          myWorkImg: AppImages.githubTrans,
          onTap: () {
            LaunchUrl.redirectToUrl(Uri.parse(
              'https://github.com/Aditya4rathod/littlelost',
            ));
          },
        ),
      ],
    ),
    MyWorkModel(
      label: 'Attendance Tracker - Geofence',
      images: [],
    ),
    MyWorkModel(
      label: 'ETA - Courier recruiter',
      images: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
      child: _buildDesktopView(context),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Column(
      children: [
        _contactMeTitle(),
        Wrap(
          spacing: 30.w,
          runSpacing: 30.h,
          alignment: WrapAlignment.center,
          children: List.generate(myWork.length, (index) {
            final item = myWork[index];
            return CustomWorkCard(
              label: item.label,
              imageData: item.images,
              frameWork: item.frameWork,
            );
          }),
        ),
      ],
    );
  }

  Widget _contactMeTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'WORK\n',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.pinkAccentColor,
            ),
            children: [
              TextSpan(
                text: "PROJECTS\n",
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
}
