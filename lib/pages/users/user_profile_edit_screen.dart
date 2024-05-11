import 'package:flutter/material.dart';
import 'package:function_world_app/controllers/consumer/profile_controller.dart';
import 'package:get/get.dart';


class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});
  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  ProfileController profileController = Get.put(ProfileController());

  bool isLoading = false;
  Map<String, dynamic> userInfo = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
            if(profileController.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
            } else {
              return Stack(
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email', // Label text
                                        style: TextStyle(
                                          color: Colors.grey, // Label text color
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Light gray border color
                                          width: 1.0, // 1px border width
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            5.0), // Rounded corners if desired
                                      ),
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // No border for the TextField
                                            hintText: profileController.profile.value.email,
                                            hintStyle: TextStyle(color: Colors.black),
                                            contentPadding: EdgeInsets.all(8.0),
                                            fillColor: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: Text("Contact Information"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Name',
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
                                        controller: profileController.nameController,
                                        decoration: InputDecoration(
                                          hintText: "Ajay",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(8.0),
                                        ),
                                      ),
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
                                            controller: profileController.phoneController,
                                            enabled: true,
                                            decoration: InputDecoration(
                                              hintText: "9539197402",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          profileController.updateProfile();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                                          child: Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
            }
        }
      ) 
    );
  }

}
