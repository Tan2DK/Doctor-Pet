import 'package:flutter/material.dart';
import 'package:doctor_pet/utils/app_assets.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added
        children: [
          Image.asset(AppImages.dCareLogo,
              width: 167, fit: BoxFit.contain, height: 125),
          _buildNavItem(context, "Home", () => _navigateTo(context, "/home")),
          _buildNavItem(
              context, "Services", () => _navigateTo(context, "/services")),
          _buildNavItem(context, "News", () => _navigateTo(context, "/news")),
          _buildNavItem(
              context, "Booking", () => _navigateTo(context, "/booking")),
          _buildLoginButton(context),
          _buildSignUpButton(context),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16), // Adjust spacing here
        child: Row(
          mainAxisSize: MainAxisSize.min, // Wrap content
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff131010),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8), // Adjust arrow spacing here
            Image.asset(AppImages.arrow, width: 16, height: 6),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: 171,
      height: 60,
      margin: const EdgeInsets.only(left: 16), // Adjust spacing here
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff2E9D2B),
      ),
      child: MaterialButton(
        onPressed: () {
          // Handle login button press
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xffFEEAEA),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      width: 171,
      height: 60,
      margin: const EdgeInsets.only(left: 16), // Adjust spacing here
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFFCA1D),
      ),
      child: MaterialButton(
        onPressed: () {
          // Handle sign up button press
        },
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff1F1F1F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }
}
