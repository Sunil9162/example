import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/services/movies_provider.dart';
import 'package:example/views/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MoviesApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<MoviesProvider>(
          builder: (BuildContext context, _controller, Widget? child) {
        if (_controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.57,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: _controller.movies.length,
          itemBuilder: (_, i) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MoviesDetailsPage(
                          movie: _controller.movies[i],
                        ),
                      ),
                    );
                  },
                  child: Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Hero(
                        tag: _controller.movies[i].id,
                        child: CachedNetworkImage(
                          imageUrl: _controller.movies[i].thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _controller.movies[i].name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _controller.movies[i].year,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
