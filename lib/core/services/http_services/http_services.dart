import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {
  static final http.Client client = http.Client();

  static Future<Map<String, dynamic>> get(String url) async {
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> post(String url) async {
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await client.post(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
