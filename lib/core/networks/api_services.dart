import 'dart:convert';

import 'package:Bloc/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
