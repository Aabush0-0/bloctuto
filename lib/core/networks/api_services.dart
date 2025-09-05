import 'package:Bloc/core/networks/api_urls.dart';
import 'package:Bloc/model/post_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  late Dio _dio;

  ApiServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = Urls.trefleToken;

          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get("posts");

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load posts: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }
}
