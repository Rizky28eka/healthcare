import 'dart:async';
import 'package:care/pages/auth/onboarding_page.dart';
import 'package:care/pages/auth/widgets/splash_page_widget.dart';
import 'package:care/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _animationComplete = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _animationComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      body: Center(
        child: _animationComplete
            ? const OnboardingPage()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SplashPageWidget(
                    child: SvgPicture.asset(
                      'assets/svg/logo.svg',
                      width: 200,
                      height: 200,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SplashPageWidget(
                    child: Text(
                      'Yummly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
