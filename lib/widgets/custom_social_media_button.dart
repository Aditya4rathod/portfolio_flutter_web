import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/app_colors.dart';

class CustomSocialMediaButton extends StatefulWidget {
  final VoidCallback onTap;
  final String logoUrl;

  const CustomSocialMediaButton(
      {Key? key, required this.onTap, required this.logoUrl})
      : super(key: key);

  @override
  State<CustomSocialMediaButton> createState() =>
      _CustomSocialMediaButtonState();
}

class _CustomSocialMediaButtonState extends State<CustomSocialMediaButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.backGroundColor,
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (enter){
          setState(() {
            isHover = true;
          });
        },
        onExit: (exit){
          setState(() {
            isHover = false;
          });
        },
        child: ClayContainer(
          color: AppColors.backGroundColor,
          height: 40.h,
          width: 40.w,
          borderRadius: 20.r,
          // depth: isHover ? 3 : 0,
          emboss: isHover ? true : false,
          child: CircleAvatar(
              backgroundColor: AppColors.backGroundColor,
              child: SvgPicture.asset(
                widget.logoUrl,
                height: 20.h,
                width: 20.w,
                color: isHover ? AppColors.pinkAccentColor : Colors.white,
              )),
        ),
      ),
    );
  }
}
