import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/custom_timelinetile.dart';

class MyExperienceView extends StatelessWidget {
  const MyExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Responsive.isDesktop(context) ? _buildDesktopView(context) : _mobileView(context),
    );
  }

  Widget _mobileView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [secondJobTimeLine(isLeftAligned: false), firstJobTimeLine(isLeftAligned: false)],
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [secondJobTimeLine(isLeftAligned: true), firstJobTimeLine(isLeftAligned: false)],
      ),
    );
  }

  Widget secondJobTimeLine({required bool isLeftAligned}) {
    return MyTimeLineTile(
      isFirst: true,
      isLast: false,
      isLeftAligned: isLeftAligned,
      logo: AppImages.moonTechnolabs,
      title: 'Moon Technolabs',
      titleUrl: 'https://www.linkedin.com/company/moontechnolabs/',
      subTitle: 'Jr. Flutter Developer',
      duration: 'Feb 2024 - Present (10 mons)',
      desc: 'Developing mobile and desktop apps with Flutter, focusing on performance, feature development, and team collaboration.',
    );
  }

  Widget firstJobTimeLine({required bool isLeftAligned}) {
    return MyTimeLineTile(
      isFirst: false,
      isLast: true,
      isLeftAligned: isLeftAligned,
      logo: AppImages.codeLineInfoTechPath,
      title: 'Codeline Infotech',
      titleUrl: 'https://www.linkedin.com/company/codeline-infotech-llp/',
      subTitle: 'Flutter Trainee & Jr. Flutter Developer',
      duration: 'Sep 2023 - Jan 2024',
      desc: 'Gained hands-on experience in Flutter development, building UIs, and debugging applications.',
    );
  }
}
