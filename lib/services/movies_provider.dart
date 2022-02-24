import 'dart:convert';
import 'dart:developer';

import 'package:example/Models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<MoviesModel> movies = [];

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  MoviesProvider() {
    getMovies();
  }

  Future<void> getMovies() async {
    setLoading(true);
    final url = Uri.parse("http://165.22.75.82/v1/movies");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['data']['movies'];
        movies.clear();
        for (var movie in jsonData) {
          movies.add(MoviesModel.fromjson(movie));
        }
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    setLoading(false);
  }
}
