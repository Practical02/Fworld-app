import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/navigation.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({super.key});

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  List<dynamic> _locations = []; // List to hold all locations
  List<dynamic> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    final String url =
        'https://fworl-backend-production.up.railway.app/locations';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _locations = jsonData['locations'];
        _filteredLocations = [
          "Thrissur",
          "Trivandrum",
          "Kollam",
          "Kottayam",
          "Calicut",
          "Palakkad",
          "Ernakulam",
          "Malapuram"
        ];
      });
    } catch (e) {
      print('Error fetching locations: $e');
      setState(() {
        _filteredLocations = [
          "Thrissur",
          "Trivandrum",
          "Kollam",
          "Kottayam",
          "Calicut",
          "Palakkad",
          "Ernakulam",
          "Malapuram"
        ];
      });
    }
  }

  Future<void> _saveSelectedLocation(String location) async {
    final box = GetStorage();
    await box.write('selected_location', location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: const Text(
          "Select Location",
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: AppColors.offBlack,
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.offBlack),
        child: ListView.builder(
          itemCount: _filteredLocations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Location.png',
                    width: 26,
                    height: 26,
                  ),
                  title: Text(
                    _filteredLocations[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    await _saveSelectedLocation(_filteredLocations[index]);
                    Get.offAllNamed(RoutesConstant.userNavigation);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
