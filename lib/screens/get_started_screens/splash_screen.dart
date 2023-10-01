import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: [
        Color(0xFF53E88B),
        Color(0xFF15BE77),
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GradientText(
              'FoodNinja',
              gradientDirection: GradientDirection.ltr,
              colors: const [
                Color(0xFF53E88B),
                Color(0xFF15BE77),
              ],
              style: GoogleFonts.viga(
                fontSize: 40,
              ),
            ),
            Text(
              'Deliver Favorite Food',
              style: GoogleFonts.inter(
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
