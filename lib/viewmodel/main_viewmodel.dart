import 'package:flutter/cupertino.dart';
import 'package:muslimmovie/core/api_responcse.dart';
import 'package:muslimmovie/model/movie.dart';
import 'package:muslimmovie/model/repositories/popular_repository.dart';

class MainViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("initial");
  List<Movie> _movies = [];
  var filteredMovies =[];

  List<Movie> get movies {
    return _movies;
  }

  ApiResponse get response{
    return _apiResponse;
  }
  Future fetPopular() async {
    try {
      List<Movie> movies = await PopularRepository().fetchPopular();
      _movies = movies;
      _apiResponse = ApiResponse.completed(movies);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void filterMovies(String query) {
    // Implement your movie filtering logic here
    if (query.isEmpty) {
      // If the query is empty, show all movies
      filteredMovies = List.from(_movies);
    } else {
      // Filter movies based on the search query
      filteredMovies = _movies.where((movie) =>
          movie.title!.toLowerCase().contains(query.toLowerCase())).toList();
    }

    // Notify listeners after updating the list
    notifyListeners();
  }
}
