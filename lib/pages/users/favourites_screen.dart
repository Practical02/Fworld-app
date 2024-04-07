import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:function_world_app/controllers/consumer/favourites_controller.dart';
import 'package:function_world_app/widgets/fav_tiles.dart';
import 'package:function_world_app/widgets/home_tile.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late Future<List<Album>> pics;
  FavouritesController favouritesController = Get.put(FavouritesController());

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://picsum.photos/v2/list?page=2&limit=5'),
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/icons/History.png"),
                height: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Recent Favourites",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Expanded(
          child: Obx(
            () {
              if(favouritesController.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: favouritesController.postList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle tap
                        },
                        child: HomeTile(
                          imageUrl: favouritesController.postList[index].url,
                          title: favouritesController.postList[index].name,
                          subTitle: favouritesController.postList[index].service,
                        ),
                      ),
                    );
                  },
                );
              }
            }
          )
        ),
      ],
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
      id: json['id'] as String,
      url: json['download_url'] as String,
    );
  }
}
