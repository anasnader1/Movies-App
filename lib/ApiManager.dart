
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:moviesapp/GetFromApi/GetNewRelease.dart';
import 'package:moviesapp/GetFromApi/GetPopular.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/GetFromApi/GetTopRelated.dart';


class ApiManager {

  String baseUrl = '  api.themoviedb.org';
  String getPopular = '/3/movie/popular';

  static Future<GetPopular> getSources() async {
    Uri url= Uri.https('  api.themoviedb.org','/3/movie/popular');
    try {
      var response = await http.get(url,headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2NhYTQ5MDBkM2ZlMDljODQ3OGRiMDMyMGQ1ZDI5ZiIsInN1YiI6IjY1NGNjY2I5NDFhNTYxMzM2YjdhNTIxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.quh9xJSGywVyjvNOQC-xZs7WeG-LwzubjI_ey56MIiU'

      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString.toString());
      return GetPopular.fromJson(json);
    }
    catch (e) {
      throw e;
    }
  }
  static Future<GetNewRelease>getNewRealesa() async {
    Uri url= Uri.https('  api.themoviedb.org','/3/movie/upcoming'
    );
    try {
      var response = await http.get(url,headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2NhYTQ5MDBkM2ZlMDljODQ3OGRiMDMyMGQ1ZDI5ZiIsInN1YiI6IjY1NGNjY2I5NDFhNTYxMzM2YjdhNTIxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.quh9xJSGywVyjvNOQC-xZs7WeG-LwzubjI_ey56MIiU'

      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString.toString());
      return GetNewRelease.fromJson(json);
    }
    catch (e) {
      throw e;
    }
  }
  static Future<GetTopRelated> getTopRelated() async {
    Uri url= Uri.https('  api.themoviedb.org','/3/movie/top_rated');
    try {
      var response = await http.get(url,headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2NhYTQ5MDBkM2ZlMDljODQ3OGRiMDMyMGQ1ZDI5ZiIsInN1YiI6IjY1NGNjY2I5NDFhNTYxMzM2YjdhNTIxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.quh9xJSGywVyjvNOQC-xZs7WeG-LwzubjI_ey56MIiU'

      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return GetTopRelated.fromJson(json);
    }
    catch (e) {
      throw e;
    }
  }

}