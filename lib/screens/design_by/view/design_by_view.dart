import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/app/app_images.dart';
import 'package:portfolio/utils/url_launcher.dart';
import 'package:portfolio/widgets/common_size.dart';
import 'package:portfolio/widgets/custom_social_media_button.dart';

class DesignByView extends StatelessWidget {
   DesignByView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDesktopView();
  }


  Widget _buildDesktopView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          height: 5,
          color: Colors.grey.withOpacity(0.6),
        ),
        CommonSize(height: 20.h,),
        _textView(),
        CommonSize(height: 20.h,),
        _socialMediaButtonView(),
        CommonSize(height: 30.h,),

      ],
    );
  }


  Widget _textView() {
    return
      RichText(
        text: TextSpan(
          text: "Designed and Managed by ",
          style: _descStyle,
          children: <TextSpan>[
            TextSpan(
                text: "Aditya Rathod",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    LaunchUrl.redirectToUrl(Uri.parse(
                        "https://www.linkedin.com/in/aditya-rathod-371886202/"));
                  },
                style: _clickableTextStyle),
          ],
        ),
      );
  }

  Widget _socialMediaButtonView() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialMediaButton(
            logoUrl: AppImages.twitter,
            onTap: () async {
              await LaunchUrl.redirectToUrl(Uri.parse("https://x.com/AdityaR1404"));
            }),
        CommonSize(
          width: 20.w,
        ),
        CustomSocialMediaButton(
            logoUrl: AppImages.linkdin,
            onTap: () async {
              await LaunchUrl.redirectToUrl(Uri.parse("https://www.linkedin.com/in/aditya-rathod-371886202/"));
            }),
        CommonSize(
          width: 20.w,
        ),
        CustomSocialMediaButton(
            logoUrl: AppImages.github,
            onTap: () async {
              await LaunchUrl.redirectToUrl(Uri.parse("https://github.com/Aditya4rathod"));
            }),
      ],
    );
  }

  final TextStyle _clickableTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        color: Colors.white.withOpacity(0.9),
      ));

  final TextStyle _descStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white.withOpacity(0.6),
      ));

}
