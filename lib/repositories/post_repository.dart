import 'dart:convert';

import 'package:bloc_practice_v1/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<dynamic>> fetchData() async {
    final url = 'https://jsonplaceholder.typicode.com/comments';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data.map((item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load Data");
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
