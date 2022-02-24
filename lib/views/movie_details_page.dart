import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/Models/movies_model.dart';
import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatefulWidget {
  final MoviesModel movie;
  const MoviesDetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _MoviesDetailsPageState createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  late MoviesModel movie;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          movie.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.thumbnail,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: movie.id,
                        child: CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.25,
                          imageUrl: movie.thumbnail,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            movie.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            movie.director,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "MainActor: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      movie.mainstar,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Film By: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      movie.director,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Year: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      movie.year,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Rating: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      movie.favoritedbyusers.toString() + " ⭐",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movie.description == ""
                      ? "No Description"
                      : movie.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Generes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (var i = 0; i < movie.genres.length; i++)
                  Text(
                    movie.genres[i].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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
