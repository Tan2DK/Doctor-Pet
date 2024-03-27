import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_pet/utils/app_assets.dart'; // Ensure this path is correct

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen =
        screenWidth > 768; // Define your breakpoint for widescreen

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal:
              isWideScreen ? 75 : 20), // Adjust padding based on screen size
      color: Color(0xff0F172B),
      child: isWideScreen
          ? _wideScreenLayout(context)
          : _narrowScreenLayout(context),
    );
  }

  Widget _wideScreenLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildColumn(
            context, "Company", ["About", "Features", "Works", "Career"]),
        _buildColumn(context, "Help", [
          "Customer Support",
          "Delivery Details",
          "Terms & Conditions",
          "Privacy Policy"
        ]),
        _buildColumn(context, "Resources", [
          "Free eBooks",
          "Development Tutorial",
          "How to - Blog",
          "YouTube Playlist"
        ]),
        _buildInstallAppColumn(context),
      ],
    );
  }

  Widget _narrowScreenLayout(BuildContext context) {
    return Column(
      children: [
        _buildColumn(
            context, "Company", ["About", "Features", "Works", "Career"]),
        _buildColumn(context, "Help", [
          "Customer Support",
          "Delivery Details",
          "Terms & Conditions",
          "Privacy Policy"
        ]),
        _buildColumn(context, "Resources", [
          "Free eBooks",
          "Development Tutorial",
          "How to - Blog",
          "YouTube Playlist"
        ]),
        _buildInstallAppColumn(context),
      ],
    );
  }

  Widget _buildColumn(BuildContext context, String title, List<String> items) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 26),
          ...items.map(
            (item) => Padding(
              padding:
                  const EdgeInsets.only(bottom: 10), // Add space between items
              child: Text(
                item,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstallAppColumn(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Install App",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 26),
          Row(
            mainAxisSize:
                MainAxisSize.min, // Aligns the buttons next to each other
            children: [
              Image.asset(
                AppImages.appstore,
                width: 150,
                height: 40,
              ),
              SizedBox(width: 10), // Space between the buttons
              Image.asset(
                AppImages.playstore,
                width: 150,
                height: 40,
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisSize:
                MainAxisSize.min, // Aligns the social icons next to each other
            children: [
              Image.asset(
                AppImages.twitter,
                width: 27,
                height: 24,
              ),
              SizedBox(width: 12), // Space between the icons
              Image.asset(
                AppImages.fb,
                width: 27,
                height: 24,
              ),
              SizedBox(width: 12), // Space between the icons
              Image.asset(
                AppImages.ins,
                width: 27,
                height: 24,
              ),
              SizedBox(width: 12), // Space between the icons
              Image.asset(
                AppImages.github,
                width: 27,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
