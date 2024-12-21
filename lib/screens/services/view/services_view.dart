import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/widgets/common_size.dart';
import 'package:portfolio/widgets/custom_services_card.dart';

import '../../../models/contact_info_model.dart';

class ServicesView extends StatelessWidget {
  ServicesView({Key? key}) : super(key: key);

  final List<ContactInfoModel> items = [
    ContactInfoModel(
        icon: Icons.phone_android, label: 'Responsive Design', desc: 'Almost every new client these days wants a mobile version of their website.'),
    ContactInfoModel(
        icon: Icons.laptop_mac_rounded,
        label: 'Desktop App Development',
        desc: 'Crafting seamless experiences for desktop platforms like Windows, macOS, and Linux users.'),
    ContactInfoModel(
        icon: Icons.code_outlined, label: 'Clean code', desc: "Especially if you work on code that is read by more than just you, it's very, very useful."),
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
        _servicesTitle(),
        CommonSize(
          height: 20.h,
        ),
        Wrap(
            spacing: 30.w,
            runSpacing: 20.h, // Vertical space between rows
            alignment: WrapAlignment.center,
            children: List.generate(3, (index) {
              final item = items[index];
              return ServicesCard(
                iconData: item.icon,
                label: item.label,
                desc: item.desc,
              );
            })),
      ],
    );
  }

  Widget _servicesTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'SERVICES\n',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.pinkAccentColor,
              ),
            ),
            children: <TextSpan>[
              TextSpan(
                text: "WHAT I DO\n",
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
