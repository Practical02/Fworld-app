// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:function_world_app/controllers/vendor/portfolio_controller.dart';
import 'package:get/get.dart';

class VendorSocial extends StatefulWidget {
  const VendorSocial({super.key});

  static String routeName = "/vendor/social";

  @override
  State<VendorSocial> createState() => _VendorSocialState();
}

class _VendorSocialState extends State<VendorSocial> {
  PortfolioController portfolioController = Get.put(PortfolioController());
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
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 60,
                          child: portfolioController.imageInitialized.isFalse ? Image.asset('assets/images/card.png') : Image.file(File(portfolioController.image.value.path)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Change Profile Picture",
                            style: TextStyle(
                              color: Color.fromRGBO(201, 176, 89, 1),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Link to Facebook', // Label text
                                style: TextStyle(
                                  color: Colors.grey, // Label text color
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(
                                      0.5), // Light gray border color
                                  width: 1.0, // 1px border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Rounded corners if desired
                              ),
                              child: TextField(
                                controller: portfolioController.facebookController,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none, // No border for the TextField
                                  contentPadding: EdgeInsets.all(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Link to Instagram', // Label text
                                style: TextStyle(
                                  color: Colors.grey, // Label text color
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(
                                      0.5), // Light gray border color
                                  width: 1.0, // 1px border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Rounded corners if desired
                              ),
                              child: TextField(
                                controller: portfolioController.instagramController,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none, // No border for the TextField
                                  contentPadding: EdgeInsets.all(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              portfolioController.updateSocials();
                            },
                            child: Text("Next >")),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 5,
                          endIndent: 130,
                          indent: 130,
                          color: Color.fromRGBO(201, 176, 89, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
