import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LocationModalContent extends StatefulWidget {
  @override
  _LocationModalContentState createState() => _LocationModalContentState();
}

class _LocationModalContentState extends State<LocationModalContent> {
  List<dynamic> _locations = []; // List to hold all locations
  List<dynamic> _filteredLocations = []; // List to hold filtered locations

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
      child: Container(
        margin: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Locations',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: _buildLocationsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationsList() {
    return ListView.builder(
      itemCount: _filteredLocations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _filteredLocations[index],
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _saveSelectedLocation(_filteredLocations[index]);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<void> _saveSelectedLocation(String location) async {
    // Initialize GetStorage
    final box = GetStorage();

    // Save selected location
    await box.write('selected_location', location);
  }
}
