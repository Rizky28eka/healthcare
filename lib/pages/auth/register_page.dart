import 'package:care/pages/auth/login_page.dart';
import 'package:care/utils/color.dart';
import 'package:care/widgets/button_txt_widget.dart';
import 'package:care/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Join Us\n',
                          style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.bold,
                            color: thirdColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Today!',
                          style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.bold,
                            color: buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * 0.02),
                  Text(
                    "Ready to discover and share amazing recipes?",
                    style: TextStyle(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: size.width * 0.10),
                  const TxtFieldWidget(
                    hintText: "Username",
                    icon: Icons.person,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: size.width * 0.05),
                  const TxtFieldWidget(
                    hintText: "Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: size.width * 0.05),
                  const TxtFieldWidget(
                    hintText: "Password",
                    icon: Icons.lock,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: size.width * 0.05),
                  Center(
                    child: Column(
                      children: [
                        BtnTxtWidget(
                          text: 'Register',
                          onPressed: () {},
                        ),
                        SizedBox(height: size.width * 0.03),
                        const Text(
                          "or",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: buttonColor,
                          ),
                        ),
                        SizedBox(height: size.width * 0.03),
                        BtnTxtWidget(
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          text: 'Continue With Google',
                        ),
                        SizedBox(height: size.width * 0.05),
                        BtnTxtWidget(
                          icon: const FaIcon(
                            FontAwesomeIcons.apple,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          text: 'Continue With Google',
                        ),
                        SizedBox(height: size.width * 0.05),
                        BtnTxtWidget(
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          text: 'Continue With Facebook',
                        ),
                        SizedBox(height: size.width * 0.05),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have an Account?',
                                style: TextStyle(
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.bold,
                                  color: thirdColor,
                                ),
                              ),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: size.width * 0.028,
                                  fontWeight: FontWeight.bold,
                                  color: buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
