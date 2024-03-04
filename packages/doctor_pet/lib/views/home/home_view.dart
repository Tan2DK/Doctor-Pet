import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_pet/core/config/constants/images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEEAEA),
      body: ListView(shrinkWrap: true, children: [
        _top(context),
        _banner(context),
        SizedBox(
          height: 47,
        ),
        _content(context),
        SizedBox(
          height: 331,
        ),
        _bottom(context),
      ]),
    );
  }

  Widget _bottom(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 75),
      height: 328,
      width: size.width,
      color: Color(0xff0F172B),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "About",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Features",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Works",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Career",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Help",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Customer Support",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Delivery Details",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Terms & Conditions",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Privacy Policy",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Resources",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Free eBooks",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Development Tutorial",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "How to - Blog",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Youtube Playlist",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xffE4E4E7),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Install App",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(
                  height: 26,
                ),
                Image.asset(
                  XImage.appstore,
                  width: 170,
                  height: 49,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  XImage.playstore,
                  width: 170,
                  height: 49,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Image.asset(
                      XImage.twitter,
                      width: 27,
                      height: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      XImage.fb,
                      width: 27,
                      height: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      XImage.ins,
                      width: 27,
                      height: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      XImage.github,
                      width: 27,
                      height: 24,
                    ),
                  ],
                )
              ],
            ))
          ]),
    );
  }

  Widget _content(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            "Features of DocterPet veterinary clinic management software",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
              fontSize: 40,
              color: Color(0xff4A4A4A),
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Expanded(
                child: _itemContent(
                  image: XImage.icon1,
                  title: "1. Manage Pet records",
                  content:
                      "Manage livestock records by animal/herd such as name, species, breed, age, gender, color, medical examination and treatment history...",
                ),
              ),
              SizedBox(
                width: 67,
              ),
              Expanded(
                child: _itemContent(
                  image: XImage.icon2,
                  title: "2. Booking an appointment ",
                  content:
                      "Manage livestock records by animal/herd such as name, species, breed, age, gender, color, medical examination and treatment history...",
                ),
              ),
              SizedBox(
                width: 67,
              ),
              Expanded(
                child: _itemContent(
                  image: XImage.icon3,
                  title: "2. Booking an appointment ",
                  content:
                      "Manage livestock records by animal/herd such as name, species, breed, age, gender, color, medical examination and treatment history...",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemContent({
    required String image,
    required String title,
    required String content,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            image,
            width: 115,
            height: 110,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
            fontSize: 32,
            color: Color(0xff4A4A4A),
            fontWeight: FontWeight.bold,
          )),
        ),
        Text(
          content,
          textAlign: TextAlign.start,
          style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
            fontSize: 22,
            color: Color(0xff575757),
            fontWeight: FontWeight.normal,
          )),
        )
      ],
    );
  }

  Widget _banner(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 630,
      child: Stack(
        children: [
          Image.asset(
            XImage.banner,
            fit: BoxFit.cover,
            width: size.width,
            height: 630,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 83, right: 16, left: size.width / 1.9),
            child: Text(
              "Welcome to Docter Pet - the streamlined veterinary clinic management software! Tailored for veterinarians, Docter Pet optimizes workflows, from patient record management to flexible appointment scheduling . With a simple, flexible, and secure interface, Docter Pet is your reliable partner, enhancing the quality of your veterinary healthcare services. Experience it now to enjoy convenience and efficiency!",
              textAlign: TextAlign.start,
              style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                fontSize: 32,
                color: Color(0xff5A1F1F),
                fontWeight: FontWeight.w400,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _top(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 108,
      width: size.width,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(
          XImage.logo,
          width: 167,
          fit: BoxFit.contain,
          height: 125,
        ),
        SizedBox(
          width: 192,
        ),
        SizedBox(
          width: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Home",
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                  fontSize: 24,
                  color: Color(0xff131010),
                  fontWeight: FontWeight.w500,
                )),
              ),
              Image.asset(
                XImage.arrow,
                width: 16,
                height: 6,
              )
            ],
          ),
        ),
        SizedBox(
          width: 43,
        ),
        SizedBox(
          width: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                  fontSize: 24,
                  color: Color(0xff131010),
                  fontWeight: FontWeight.w500,
                )),
              ),
              Image.asset(
                XImage.arrow,
                width: 16,
                height: 6,
              )
            ],
          ),
        ),
        SizedBox(
          width: 43,
        ),
        SizedBox(
          width: 125,
          child: Text(
            "News",
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
              fontSize: 24,
              color: Color(0xff131010),
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
        SizedBox(
          width: 43,
        ),
        SizedBox(
          width: 125,
          child: Text(
            "Booking",
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
              fontSize: 24,
              color: Color(0xff131010),
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
        SizedBox(
          width: 101,
        ),
       Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      width: 171,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff2E9D2B),
      ),
      child: MaterialButton(
        onPressed: () {
          // Xử lý sự kiện khi nút "Login" được nhấn
        },
        child: Center(
          child: Text(
            "Login",
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                fontSize: 24,
                color: Color(0xffFEEAEA),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
    SizedBox(width: 36), // Khoảng cách giữa hai nút
    Container(
      width: 171,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFFCA1D),
      ),
      child: MaterialButton(
        onPressed: () {
          // Xử lý sự kiện khi nút "Sign Up" được nhấn
        },
        child: Center(
          child: Text(
            "Sign Up",
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                fontSize: 24,
                color: Color(0xff1F1F1F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
),

      ]),
    );
  }
}
