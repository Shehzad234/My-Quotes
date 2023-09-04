import 'package:flutter/material.dart';
import 'package:quotes_app/res/components/custom_button.dart';
import 'package:quotes_app/res/components/custom_logo_button.dart';
import 'package:quotes_app/res/components/custom_textfield.dart';
import 'package:quotes_app/res/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              // Already have an account, Sign in button
              Padding(
                padding: const EdgeInsets.only(top: 45, right: 12, bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 27, 25, 25),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.greyColor,
                          width: 0.5,
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // App Logo
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  'Quotez Logo',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontFamily: 'Times New Roman',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // TextFormFields
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: const Text(
                            'Enter your details below',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w200),
                          ),
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          controller: emailController,
                          focusNode: emailFocusNode,
                          text: email,
                        ),

                        CustomTextField(
                          labelText: 'Password',
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          text: password,
                        ),

                        // Button
                        CustomButton(
                          text: 'Sign up',
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),

                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),
                        // ---- or signup with ----
                        Row(
                          children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 12),
                                child: Divider(),
                              ),
                            ),
                            Text(
                              'Or sign in with',
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 12),
                                child: Divider(),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomLogoButton(
                                url: 'assets/images/google.png',
                                text: 'Google',
                              ),
                              SizedBox(width: 10),
                              CustomLogoButton(
                                isFacebook: true,
                                url: 'assets/images/facebook.png',
                                text: 'Facebook',
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
        ],
      ),
    );
  }
}
