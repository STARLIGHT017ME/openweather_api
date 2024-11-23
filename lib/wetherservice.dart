import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = "e31f809f7ec1e5b36df05bee65276941";
  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather";

  static Future<Map<String, dynamic>?> fetchWeather(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey");
    print("open weather url: $baseUrl?q=$city&appid=$apiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(" the jsondecode is :$jsonDecode(response.body");

        return jsonDecode(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
