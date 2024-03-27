import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_pet/utils/app_assets.dart'; // Make sure this path matches your actual assets directory

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            "Features of DoctorPet veterinary clinic management software",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
              fontSize: 40,
              color: Color(0xff4A4A4A),
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(height: 11),
          _featureItem(context, AppImages.icon1, "Manage Pet Records",
              "Manage livestock records by animal/herd such as name, species, breed, age, gender, color, medical examination and treatment history..."),
          SizedBox(height: 30),
          _featureItem(context, AppImages.icon2, "Booking an Appointment",
              "Easy appointment scheduling with instant notifications and reminders for both pet owners and the clinic..."),
          SizedBox(height: 30),
          _featureItem(
              context,
              AppImages.icon3,
              "Find the Nearest Veterinary Clinic",
              "Quickly locate the nearest veterinary clinic for emergency and regular check-ups..."),
        ],
      ),
    );
  }

  Widget _featureItem(
      BuildContext context, String icon, String title, String content) {
    return Row(
      children: [
        Image.asset(icon, width: 115, height: 110),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                  fontSize: 32,
                  color: Color(0xff4A4A4A),
                  fontWeight: FontWeight.bold,
                )),
              ),
              Text(
                content,
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                  fontSize: 22,
                  color: Color(0xff575757),
                  fontWeight: FontWeight.normal,
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
