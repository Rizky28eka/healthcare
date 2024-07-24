import 'package:care/controllers/login_controller.dart';
import 'package:care/pages/auth/forgot_password_page.dart';
import 'package:care/pages/auth/register_page.dart';
import 'package:care/utils/color.dart';
import 'package:care/widgets/button_txt_widget.dart';
import 'package:care/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());

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
              child: Form(
                key: loginController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome\n',
                            style: TextStyle(
                              fontSize: size.width * 0.12,
                              fontWeight: FontWeight.bold,
                              color: thirdColor,
                            ),
                          ),
                          TextSpan(
                            text: 'back!',
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
                      "Welcome back! Ready to dive into a world of delicious recipes?",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(height: size.width * 0.10),
                    TxtFieldWidget(
                      hintText: "Email",
                      icon: Icons.person,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) =>
                          loginController.emailController.text = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.width * 0.05),
                    TxtFieldWidget(
                      hintText: "Password",
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) =>
                          loginController.passwordController.text = value,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.width * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: size.width * 0.025,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.width * 0.05),
                    Center(
                      child: Column(
                        children: [
                          Obx(() => BtnTxtWidget(
                                text: 'Login',
                                onPressed: loginController.login,
                                isLoading: loginController.isLoading.value,
                              )),
                          SizedBox(height: size.width * 0.05),
                          const Text(
                            "or",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: buttonColor,
                            ),
                          ),
                          SizedBox(height: size.width * 0.05),
                          Obx(() => BtnTxtWidget(
                                icon: const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                                onPressed: loginController.googleSignIn,
                                text: 'Continue With Google',
                                isLoading: loginController.isLoading.value,
                              )),
                          SizedBox(height: size.width * 0.05),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    fontSize: size.width * 0.028,
                                    fontWeight: FontWeight.bold,
                                    color: thirdColor,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.01),
                                Text(
                                  'Register',
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
      ),
    );
  }
}
