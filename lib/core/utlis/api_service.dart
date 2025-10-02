import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get({required String uri}) async {
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
 
      var data = jsonDecode(response.body);
      return data;
 
   
  }

  Future<dynamic> add({required String uri, required dynamic body}) async {
    var url = Uri.parse(uri);
    http.Response response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    var result = jsonDecode(response.body);
    return result;
  }

  Future<dynamic> update({
    required String uri,
    required dynamic body
  }) async {
    var url = Uri.parse(uri);
    http.Response response = await http.put(
      url,
      body: jsonEncode(body),
      headers: { 'Content-Type': 'application/json' },
    );
    var result = jsonDecode(response.body);
    return result ;

  }

  Future<dynamic> delete({required String uri}) async {
    var url = Uri.parse(uri);
    http.Response response = await http.delete(url);
    var result = jsonDecode(response.body);
    return result;
  }
}
