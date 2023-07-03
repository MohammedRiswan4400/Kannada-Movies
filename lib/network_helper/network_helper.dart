import 'package:http/http.dart' as http;

import 'model.dart';

class NetworkHelper {
  static Future<Movies> fetchDataFromApi() async {
    const api = "https://hoblist.com/api/movieList";
    final url = Uri.parse(api);
    final body = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    };
    final response = await http.post(url, body: body);
    // log(response.body.toString());
    final json = moviesFromJson(response.body);
    if (response.statusCode == 200) {
      // log(response.body);
      return json;
    }
    return json;
  }
}
