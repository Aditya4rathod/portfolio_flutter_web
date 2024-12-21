import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/models/contact_info_model.dart';
import 'package:portfolio/widgets/common_size.dart';
import 'package:portfolio/widgets/custom_card.dart';

class ContactMeView extends StatelessWidget {
  ContactMeView({Key? key}) : super(key: key);

  final List<ContactInfoModel> items = [
    ContactInfoModel(icon: Icons.call, label: 'Phone', desc: '+91 743 602 855'),
    ContactInfoModel(icon: Icons.location_on, label: 'Address', desc: 'Ahmedabad, Gujarat'),
    ContactInfoModel(icon: Icons.alternate_email, label: 'Email', desc: 'adityarathod1404@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
        child: _buildDesktopView(context),
    );
  }

/*  Widget _buildMobileView(BuildContext context) {
    return Column(
      children: [
        _contactMeTitle(),
        // SizedBox(height: 10.h),
        Expanded(
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (context, index) {
              final item = items[index];
              return CustomCard(
                iconData: item.icon,
                label: item.label,
                desc: item.desc,
              );
            },
          ),
        ),
      ],
    );
  }*/

  Widget _buildDesktopView(BuildContext context) {
    return Column(
      children: [
        _contactMeTitle(),
        Wrap(
          spacing: 30.w,
          runSpacing: 20.h, // Vertical space between rows
          alignment: WrapAlignment.center,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return CustomCard(
              iconData: item.icon,
              label: item.label,
              desc: item.desc,
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
            text: 'CONTACT\n',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.pinkAccentColor,
              ),
            ),
            children: <TextSpan>[
              TextSpan(
                text: "GET IN TOUCH\n",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
