import 'package:care/pages/auth/login_page.dart';
import 'package:care/pages/auth/widgets/onboarding_widget.dart';
import 'package:care/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: primaryColor,
      skipStyle: ButtonStyle(
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 17)),
        foregroundColor: WidgetStateProperty.all(buttonColor),
      ),
      pages: [
        OnboardingPageWidget(
          image: SvgPicture.asset(
            'assets/svg/health1.svg',
          ),
          title: 'Track Your Health',
          description:
              'Monitor your health and wellness with our comprehensive tracking tools.',
        ),
        OnboardingPageWidget(
          image: SvgPicture.asset('assets/svg/health2.svg'),
          title: 'Stay Fit',
          description: 'Access personalized workout plans and fitness guides.',
        ),
        OnboardingPageWidget(
          image: SvgPicture.asset('assets/svg/health3.svg'),
          title: 'Healthy Eating',
          description:
              'Discover nutritious recipes and meal plans tailored to your needs.',
        ),
      ].map((model) => model.buildPage()).toList(),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: buttonColor,
        ),
      ),
      onDone: () => _onIntroEnd(context),
      nextStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(buttonColor),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10),
        activeColor: buttonColor,
        activeSize: Size.square(17),
      ),
    );
  }
}
