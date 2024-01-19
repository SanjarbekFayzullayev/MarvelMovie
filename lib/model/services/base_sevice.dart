abstract class BaseService {
  final String apiKey = "My API cey paste her";
  final String baseUrl = "https://mcuapi.herokuapp.com/api/v1/movies";

  Future<dynamic> getResponse(String url);
}
