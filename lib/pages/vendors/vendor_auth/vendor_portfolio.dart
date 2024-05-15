// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:function_world_app/controllers/vendor/portfolio_controller.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_gallery.dart';
import 'package:get/get.dart';

class VendorPortfolio extends StatefulWidget {
  const VendorPortfolio({super.key});

  static String routeName = "/vendor/portfolio";

  @override
  State<VendorPortfolio> createState() => _VendorPortfolioState();
}

class _VendorPortfolioState extends State<VendorPortfolio> {
  PortfolioController portfolioController = Get.put(PortfolioController());
  bool isLoading = false;
  Map<String, dynamic> vendorInfo = {};

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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text("About Section"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Vendor Name', // Label text
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              border: Border.all(
                                color: Colors.white, // Light gray border color
                                width: 1.0, // 1px border width
                              ),
                              borderRadius: BorderRadius.circular(
                                  5.0), // Rounded corners if desired
                            ),
                            child: TextField(
                              controller: portfolioController.nameController,
                              enabled: true,
                              decoration: InputDecoration(
                                  border: InputBorder
                                      .none, // No border for the TextField
                                  hintText: 'Enter your Vendor Name',
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding: EdgeInsets.all(8.0),
                                  fillColor: Colors.white),
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
                              'Description', // Label text
                              style: TextStyle(
                                color: Colors.grey, // Label text color
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
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
                              controller: portfolioController.descriptionController,
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
                              'Services',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextField(
                              controller: portfolioController.servicesController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text("Contact Information"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextField(
                              controller: portfolioController.phoneController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                portfolioController.updateDetails();
                              },
                              label: Text("Next"),
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 5,
                              endIndent: 130,
                              indent: 130,
                              color: Color.fromRGBO(201, 176, 89, 1),
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
        ],
      ),
    );
  }

}
