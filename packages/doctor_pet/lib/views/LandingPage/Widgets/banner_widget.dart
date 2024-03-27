import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_pet/utils/app_assets.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth < 600 ? 18 : 32;
    double padding = screenWidth < 600 ? 20 : screenWidth / 1.9;

    return SizedBox(
      height: 630,
      width: screenWidth,
      child: Stack(
        children: [
          Image.asset(
            AppImages.banner, // Replace with your asset path
            fit: BoxFit.cover,
            width: screenWidth,
            height: 630,
          ),
          Padding(
            padding: EdgeInsets.only(top: 83, right: 16, left: padding),
            child: Text(
              "Welcome to Doctor Pet - the streamlined veterinary clinic management software! Tailored for veterinarians, Doctor Pet optimizes workflows, from patient record management to flexible appointment scheduling. With a simple, flexible, and secure interface, Doctor Pet is your reliable partner, enhancing the quality of your veterinary healthcare services. Experience it now to enjoy convenience and efficiency!",
              style: GoogleFonts.nunitoSans(
                fontSize: fontSize,
                color: Color(0xff5A1F1F),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
