import 'dart:convert';

import 'package:function_world_app/widgets/gallery_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';

class UserVendorProfile extends StatefulWidget {
  const UserVendorProfile({super.key});

  @override
  State<UserVendorProfile> createState() => _UserVendorProfileState();
}

class _UserVendorProfileState extends State<UserVendorProfile> {
  late Future<List<Album>> pics;
  bool isFollowing = false;
  bool isLiked = false;
  bool isFav = false;

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
              Container(
                height: MediaQuery.sizeOf(context).width * 0.8,
                width: MediaQuery.sizeOf(context).width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: const Image(
                  image: NetworkImage('https://picsum.photos/360/300'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vendor Name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "125 followers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "475 likes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage(isLiked
                                    ? 'assets/icons/likeActive.png'
                                    : 'assets/icons/like.png'),
                                height: 28,
                              ),
                            ),
                            const Text(
                              "475 likes",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 9,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                color: isFollowing
                                    ? AppColors.primaryColor
                                    : Colors.transparent),
                            child: Text(
                              isFollowing ? "Following" : "Follow",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage(isFav
                                ? 'assets/icons/starActive.png'
                                : 'assets/icons/star.png'),
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We provide the best",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Our team is composed of highly skilled event planners, coordinators, designers, and logistical experts who thrive on turning your vision into reality. We understand that each event is unique, and we pride ourselves on delivering personalized solutions tailored to your specific needs and goals.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "Our Gallery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<Album>>(
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
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 14,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GalleryTile(
                            imageUrl: snapshot.data![index].url,
                          );
                        },
                      );
                    }
                  },
                ),
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
