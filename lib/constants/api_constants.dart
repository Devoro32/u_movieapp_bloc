//#30
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.get("moviesApiKey");
  static String bearerToken = dotenv.get("moviesBearerToken");

  static String baseUrl = 'https://api.themoviedb.org/3/';
  static Map<String, String> get headers => {
    'Authorization': 'Bearer $bearerToken',
  };
}
//!use package flutter_dotenv, to create an environment 
//!where keys are not stored in github
//!created assets/.env