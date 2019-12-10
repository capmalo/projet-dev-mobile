import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://randomuser.me";

class API {
  static Future getUsers() {
    var url = baseUrl + "/api?results=10&seed=ouvmob";
    return http.get(url);
  }
}