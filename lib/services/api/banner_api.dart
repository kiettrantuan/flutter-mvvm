import 'dart:convert';

import 'package:f_mvvm_1/models/banner.dart';
import 'package:http/http.dart' as http;

class BannerApi {
  final String baseUrl = 'https://picsum.photos';

  Future<List<Banner>> fetchBanners({int? page, int? limit}) async {
    final res = await http.get(
        Uri.parse('$baseUrl/v2/list?page=${page ?? 3}&limit=${limit ?? 5}'));

    if (res.statusCode == 200) {
      List jsonData = json.decode(res.body);
      return jsonData.map((item) => Banner.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
