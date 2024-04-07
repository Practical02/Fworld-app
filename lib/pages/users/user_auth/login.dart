// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:function_world_app/controllers/consumer/auth_controller.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/navigation.dart';
import 'package:function_world_app/pages/users/user_auth/forgot_password.dart';
import 'package:function_world_app/pages/users/user_auth/register.dart';
import 'package:get/get.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  static String routeName = "/user/login";

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  String emailError = '';
  String passwordError = '';

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void validateFields() {
    setState(() {
      emailError = '';
      passwordError = '';
    });

    final String email = emailController.text.trim();
    final String password = passwordController.text;

    if (email.isEmpty) {
      setState(() {
        emailError = 'Email is required';
      });
    }

    if (password.isEmpty) {
      setState(
        () {
          passwordError = 'Password is required';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(0, 0, 0, 0.47),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 24),
                height: MediaQuery.sizeOf(context).height * 0.25,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter the realm",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "of immaculate occasions.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/Fworld-Logo.png',
                        height: 300,
                        color: Colors.white12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                color: AppColors.offWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black38.withOpacity(
                                      0.5), // Light gray border color
                                  width: 1.0, //   1px border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Rounded corners if desired
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none, // No border for the TextField
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding: EdgeInsets.all(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black38.withOpacity(0.5),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText:
                                    !_isPasswordVisible, // Toggle password visibility
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your Password',
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding: EdgeInsets.all(8.0),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black38,
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text(
                                (emailError),
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                emailError.isNotEmpty & passwordError.isNotEmpty
                                    ? " and "
                                    : "",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                passwordError,
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              authController.loginConsumer(emailController.text, passwordController.text);
                            },
                            child: Text(
                              'Forgot Password ? ',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              validateFields();
                              authController.loginConsumer(emailController.text, passwordController.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      4), // No rounded edges
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UserRegistration.routeName);
                          },
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
