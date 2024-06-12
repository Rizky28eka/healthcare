import 'package:care/pages/auth/otp_verification_page.dart';
import 'package:care/utils/color.dart';
import 'package:care/widgets/button_txt_widget.dart';
import 'package:care/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: thirdColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: buttonColor,
          labelColor: buttonColor,
          unselectedLabelColor: thirdColor,
          tabs: const [
            Tab(text: 'Email'),
            Tab(text: 'SMS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildEmailTab(size),
          buildSmsTab(size),
        ],
      ),
    );
  }

  Widget buildEmailTab(Size size) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: thirdColor,
                  ),
                ),
                SizedBox(height: size.width * 0.02),
                Text(
                  'Enter your email address and we will send you a link to reset your password.',
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: size.width * 0.10),
                const TxtFieldWidget(
                  hintText: "Email",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.width * 0.10),
                Center(
                  child: BtnTxtWidget(
                    keyboardType: TextInputType.emailAddress,
                    text: 'Send Reset Link',
                    onPressed: () {
                      // Logic to handle sending the reset link via email
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSmsTab(Size size) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: thirdColor,
                  ),
                ),
                SizedBox(height: size.width * 0.02),
                Text(
                  'Enter your phone number and we will send you an SMS to reset your password.',
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: size.width * 0.10),
                const TxtFieldWidget(
                  hintText: "Phone Number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.width * 0.10),
                Center(
                  child: BtnTxtWidget(
                    text: 'Send SMS',
                    onPressed: () {
                      // Logic to handle sending the reset link via SMS
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPVerificationPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
