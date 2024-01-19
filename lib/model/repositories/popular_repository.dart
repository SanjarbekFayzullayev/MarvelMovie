import 'package:muslimmovie/model/movie.dart';
import 'package:muslimmovie/model/services/base_sevice.dart';
import 'package:muslimmovie/model/services/populae_service.dart';

class PopularRepository {
  final BaseService _popularService = PopularService();

  Future<List<Movie>> fetchPopular() async {
    dynamic response = await _popularService.getResponse("/popular");
    final data = response["data"] as List;

    List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();
  return movies;
  }
}
