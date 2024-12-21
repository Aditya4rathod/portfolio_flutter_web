import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/screens/my_expertise/my_education/my_education_view.dart';
import 'package:portfolio/screens/my_expertise/my_experience/my_experience_view.dart';
import 'package:portfolio/screens/my_expertise/my_skills/my_skills_view.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/common_size.dart';

class MyExpertiseTabView extends StatefulWidget {
  const MyExpertiseTabView({Key? key}) : super(key: key);

  @override
  _MyExpertiseTabViewState createState() => _MyExpertiseTabViewState();
}

class _MyExpertiseTabViewState extends State<MyExpertiseTabView> {
  int _selectedIndex = 0; // To track the selected tab

  // List of views to display based on selectedIndex
  final List<Widget> _views = [
    MyExperienceView(),
    MySkillsView(),
    MyEducation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tabs
              _buildTab("Experience", 0),
              CommonSize(width: 10.w),
              _buildTab("Skills", 1),
              CommonSize(width: 10.w),
              _buildTab("Education", 2),
            ],
          ),
          CommonSize(height: 30.h),
          // Display the view corresponding to the selected index
          _views[_selectedIndex],
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = _selectedIndex == index;

    return InkWell(
      highlightColor: AppColors.backGroundColor,
      onTap: () => setState(() => _selectedIndex = index),
      child: ClayContainer(
        color: AppColors.backGroundColor,
        height: 40.h,
        width: Responsive.isMobile(context) ? 100.w : 120.w,
        borderRadius: 25.r,
        depth: isSelected ? 5 : 2,
        curveType: isSelected ? CurveType.concave : CurveType.convex,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: isSelected ? AppColors.pinkAccentColor : Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
