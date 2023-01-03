import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../entities/movie/movies.dart';
import '../entities/detail/detail.dart';
import '../entities/tresult/tresult.dart';

class MovieServices {
  Dio dio = Dio();
  Future<TResult<List<Movies>?>> getPopularMovies({int page = 1}) async {
    try {
      var res = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=b67a39c442fd03a92fa809c9edcb0374");

      return TResult.success((res.data["results"] as List)
          .map((e) => Movies.fromJson(e))
          .toList());
    } on DioError catch (e) {
      log(e.response.toString());
      return TResult.failed(e.response.toString());
    }
  }

  Future<TResult<Detail>?> getMovieDetail(int movie_id) async {
    try {
      var res = await dio.get(
          "https://api.themoviedb.org/3/movie/${movie_id}?api_key=b67a39c442fd03a92fa809c9edcb0374");

      return TResult.success(Detail.fromJson(res.data));
    } on DioError catch (e) {
      log(e.response.toString());
      return TResult.failed(e.response.toString());
    }
  }

  String posterImage(String path) {
    return "https://image.tmdb.org/t/p/original$path";
  }
}
