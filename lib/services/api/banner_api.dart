import 'dart:convert';

import 'package:f_mvvm_1/models/banner.dart';
import 'package:http/http.dart' as http;

class BannerApi {
  final String baseUrl = 'https://picsum.photos';

  Future<List<Banner>> fetchBanners({int? page = 3, int? limit = 5}) async {
    final res =
        await http.get(Uri.parse('$baseUrl/v2/list?page=$page&limit=$limit'));

    if (res.statusCode == 200) {
      List jsonData = json.decode(res.body);
      return jsonData.map((item) => Banner.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
