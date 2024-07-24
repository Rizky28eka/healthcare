import 'package:care/pages/auth/login_page.dart';
import 'package:care/utils/color.dart';
import 'package:care/widgets/button_txt_widget.dart';
import 'package:care/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.05),
            child: GetBuilder<RegisterController>(
              builder: (_) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Create Account\n',
                              style: TextStyle(
                                fontSize: size.width * 0.12,
                                fontWeight: FontWeight.bold,
                                color: thirdColor,
                              ),
                            ),
                            TextSpan(
                              text: 'and Join Us!',
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
                        "Enter your details to create a new account.",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: size.width * 0.10),
                      TxtFieldWidget(
                        hintText: "Username",
                        icon: Icons.person,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => _controller.email.value = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegExp.hasMatch(value)) {
                            return 'Enter a valid email';
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
                            _controller.password.value = value,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.width * 0.05),
                      TxtFieldWidget(
                        hintText: "Confirm Password",
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) =>
                            _controller.confirmPassword.value = value,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm your password';
                          }
                          if (value != _controller.password.value) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.width * 0.05),
                      Center(
                        child: Column(
                          children: [
                            BtnTxtWidget(
                              text: 'Register',
                              onPressed: _controller.isLoading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _controller.register();
                                      }
                                    },
                              isLoading: _controller.isLoading.value,
                            ),
                            SizedBox(height: size.width * 0.05),
                            const Text(
                              "or",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: buttonColor,
                              ),
                            ),
                            SizedBox(height: size.width * 0.05),
                            BtnTxtWidget(
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              onPressed: _controller.isLoading.value
                                  ? null
                                  : _controller.signInWithGoogle,
                              text: 'Continue With Google',
                            ),
                            SizedBox(height: size.width * 0.05),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> register() async {
    isLoading.value = true;

    if (email.value.isEmpty ||
        password.value.isEmpty ||
        confirmPassword.value.isEmpty) {
      showPopup("Email and passwords must not be empty");
      isLoading.value = false;
      return;
    }

    if (password.value != confirmPassword.value) {
      showPopup("Passwords do not match");
      isLoading.value = false;
      return;
    }

    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      if (userCredential.user != null) {
        showPopup("User successfully registered");
        Get.offNamed("/home");
      }
    } catch (e) {
      showPopup("Error occurred: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        if (userCredential.user != null) {
          showPopup("User is successfully signed in");
          Get.offNamed("/home");
        }
      } else {
        showPopup("Google sign in canceled");
      }
    } catch (e) {
      showPopup("Error occurred: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void showPopup(String message) {
    Get.snackbar(
      'Notification',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}
