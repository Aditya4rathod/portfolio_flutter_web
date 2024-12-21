import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/models/my_skills_model.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/common_skill_widget.dart';


class MySkillsView extends StatelessWidget {
   MySkillsView({Key? key}) : super(key: key);

  final List<MySkillsModel> items = [
    MySkillsModel(frameWork: 'Flutter', percentRating: '80', rate: 0.8),
    MySkillsModel(frameWork: 'Dart', percentRating: '80', rate: 0.8),
    MySkillsModel(frameWork: 'FlutterFlow', percentRating: '70', rate: 0.7),
    MySkillsModel(frameWork: 'Firebase', percentRating: '75', rate: 0.75),
    MySkillsModel(frameWork: 'OOPS', percentRating: '80', rate: 0.8),
    MySkillsModel(frameWork: "Teamwork", percentRating: '85', rate: 0.85),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ?  30.w : 10.w, vertical: 20.h),
        child: Responsive.isDesktop(context) ? _buildDesktopView(context) : _buildMobileView(context),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: _buildDesktopGridView(context),
    );
  }

  Widget _buildDesktopGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
      childAspectRatio: 6,
      shrinkWrap: true,
      children: List.generate(items.length, (index) {
        final value = items[index];
        return CustomSkillWidget(
          frameWork: value.frameWork,
          percentage: value.percentRating,
          progressValue: value.rate,
        );
      }),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final value = items[index];
        return CustomSkillWidget(
          frameWork: value.frameWork,
          percentage: value.percentRating,
          progressValue: value.rate,
        );
      }),
    );
  }
}
