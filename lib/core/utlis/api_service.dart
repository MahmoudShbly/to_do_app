import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get({required String uri}) async {
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<dynamic> add({required String uri,required dynamic body}) async {
    var url = Uri.parse(uri);
    http.Response response= await http.post(url,
    body: jsonEncode(body),
    headers: {"Content-Type": "application/json"}
    );
    var result = jsonDecode(response.body);
    return result;
    
  }
}
