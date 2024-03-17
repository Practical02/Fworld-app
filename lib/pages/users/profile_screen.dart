import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:http/http.dart' as http;
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/widgets/fav_tiles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<Album>> pics;

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://picsum.photos/v2/list?page=2&limit=9'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Album> albums =
          jsonResponse.map((item) => Album.fromJson(item)).toList();
      return albums;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    pics = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.offBlack,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(height: 10),
              const Text(
                "John Doe",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "47",
                    style: TextStyle(
                        color: Color.fromRGBO(201, 176, 89, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Liked",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 35),
                  Text(
                    "47",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Following",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Find Vendors",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, UserIntro.routeName, (route) => false);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 76.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 12),
                child: const Text(
                  "Our Recommendations",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Album>>(
                future: pics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return FavTile(
                          imageUrl: snapshot.data![index].url,
                          title: "Test Heading 1",
                          subTitle: "Test sub heading",
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Album {
  final String id;
  final String url;

  Album({
    required this.id,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'].toString(),
      url: json['download_url'] as String,
    );
  }
}
