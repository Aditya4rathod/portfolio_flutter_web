import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/models/my_work_model.dart';
import 'package:portfolio/widgets/common_size.dart';

class CustomWorkCard extends StatelessWidget {
  final String label;
  final List<ImageData> imageData;
  final String? frameWork;

  const CustomWorkCard({
    Key? key,
    required this.label,
    required this.imageData,
    this.frameWork
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: AppColors.backGroundColor,
      height: 150.h,
      width: 350.w,
      borderRadius: 10.r,
      depth: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          CommonSize(height: 35.h),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          CommonSize(height: 10.h),
          Expanded(
            child: _buildImageList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 6.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        color: AppColors.pinkAccentColor,
      ),
    );
  }

  Widget _buildImageList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w , vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.separated(
            itemCount: imageData.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final image = imageData[index];
              return InkWell(
                onTap: image.onTap, // Correctly trigger onTap function
                child: Image.asset(
                  image.myWorkImg,
                  height: 20,
                  width: 20,
                ),
              );
            },
            separatorBuilder: (context, index) => CommonSize(width: 10.w),
          ),
          Text(frameWork ??"Flutter", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white.withOpacity(0.7),)),
          )
        ],
      ),
    );
  }
}
