import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/custom_timelinetile.dart';

class MyEducation extends StatelessWidget {
  const MyEducation({Key? key}) : super(key: key);

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
        children: [collageEducation(isLeftAligned: false), schoolEducation(isLeftAligned: false)],
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [collageEducation(isLeftAligned: true), schoolEducation(isLeftAligned: false)],
      ),
    );
  }


  Widget collageEducation({required bool isLeftAligned}) {
    return MyTimeLineTile(
      isFirst: true,
      isLast: false,
      isLeftAligned: isLeftAligned,
      logo: AppImages.gmiuPath,
      title: 'Gyanmanjari Innovative University-GMIU',
      titleUrl: 'https://www.linkedin.com/company/gyanmanjari/',
      subTitle: 'B.E IT',
      duration: '2019-2023',
      desc: 'Devoted to excellence in teaching, learning & research, & to developing leaders who make a difference',
    );
  }

  Widget schoolEducation({required bool isLeftAligned}) {
    return MyTimeLineTile(
      isFirst: false,
      isLast: true,
      isLeftAligned: isLeftAligned,
      logo: AppImages.guruKul,
      title: 'Shree Swaminarayan Gurukul',
      titleUrl: 'https://www.facebook.com/gurukulbhavnagar/',
      subTitle: 'Science',
      duration: '2017 - 2019',
      desc:
      "'Where tradition and vision meet' apply describes the philosophy upon which Shree Swaminarayan Gurukul Campus bases the design of education it offers for its students",
    );
  }


}
