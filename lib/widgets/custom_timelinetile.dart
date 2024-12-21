import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/common_size.dart';
import 'package:portfolio/widgets/custom_experience_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isLeftAligned; // New property to determine zigzag alignment
  final String logo;
  final String title;
  final String? titleUrl;
  final String subTitle;
  final String duration;
  final String desc;

  const MyTimeLineTile(
      {Key? key,
      required this.isFirst,
      required this.isLast,
      this.isLeftAligned = false, // default to false for right alignment
      required this.logo,
      required this.title,
      this.titleUrl,
      required this.subTitle,
      required this.duration,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSize(
      height: Responsive.isDesktop(context) ? 280.h : MediaQuery.of(context).size.height / 2,
      child: TimelineTile(
        alignment: Responsive.isDesktop(context) ? TimelineAlign.center : TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: Colors.grey.withOpacity(0.6), thickness: 1),
        indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          color: Colors.transparent,
          indicator: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withOpacity(0.6), width: 1),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                color: AppColors.pinkAccentColor,
                size: 20,
              ),
            ),
          ),
        ),
        startChild: isLeftAligned
            ? Padding(
                padding: EdgeInsets.only(right: 20.w, left: 60.w),
                child: CustomExperienceCard(
                  isLeftAligned: isLeftAligned,
                  logo: logo,
                  title: title,
                  subTitle: subTitle,
                  duration: duration,
                  titleUrl: titleUrl,
                  desc: desc,
                ),
              )
            : null,
        endChild: !isLeftAligned
            ? Padding(
                padding: Responsive.isDesktop(context) ? EdgeInsets.only(left: 20.w, right: 60.w) : EdgeInsets.symmetric(horizontal: 20.w , vertical: 20.h),
                child: CustomExperienceCard(
                  isLeftAligned: isLeftAligned,
                  logo: logo,
                  title: title,
                  titleUrl: titleUrl,
                  subTitle: subTitle,
                  duration: duration,
                  desc: desc,
                ),
              )
            : null,
      ),
    );
  }
}
