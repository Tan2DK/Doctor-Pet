import 'package:flutter/material.dart';
import 'package:doctor_pet/utils/app_assets.dart'; // Ensure this path is correct

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth *
              0.05), // Use a percentage of screen width for padding
      child: Column(
        children: [
          Text(
            "Features of DoctorPet veterinary clinic management software",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth < 600
                  ? 28
                  : 40, // Adjust text size based on screen width
              color: Color(0xff4A4A4A),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
              height:
                  screenWidth < 600 ? 8 : 11), // Adjust based on screen width
          _featureItem(
            context,
            AppImages.icon1,
            "Manage Pet Records",
            "Manage livestock records by animal/herd such as name, species, breed, age, gender, color, medical examination and treatment history...",
            screenWidth,
          ),
          SizedBox(
              height:
                  screenWidth < 600 ? 20 : 30), // Adjust based on screen width
          _featureItem(
            context,
            AppImages.icon2,
            "Booking an Appointment",
            "Easy appointment scheduling with instant notifications and reminders for both pet owners and the clinic...",
            screenWidth,
          ),
          SizedBox(
              height:
                  screenWidth < 600 ? 20 : 30), // Adjust based on screen width
          _featureItem(
            context,
            AppImages.icon3,
            "Find the Nearest Veterinary Clinic",
            "Quickly locate the nearest veterinary clinic for emergency and regular check-ups...",
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _featureItem(BuildContext context, String icon, String title,
      String content, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          width: screenWidth < 600
              ? 80
              : 115, // Adjust image size based on screen width
          height: screenWidth < 600 ? 80 : 110,
        ),
        SizedBox(
            width: screenWidth < 600
                ? 10
                : 16), // Adjust spacing based on screen width
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth < 600
                      ? 24
                      : 32, // Adjust font size based on screen width
                  color: Color(0xff4A4A4A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: screenWidth < 600
                      ? 18
                      : 22, // Adjust font size based on screen width
                  color: Color(0xff575757),
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
