import 'package:f_mvvm_1/models/banner.dart';
import 'package:f_mvvm_1/services/api/banner_api.dart';
import 'package:flutter/foundation.dart';

class BannerViewModel extends ChangeNotifier {
  final BannerApi _apiService;
  List<Banner> _banners = [];
  bool _isLoading = false;
  bool _disposed = false;

  bool get isLoading => _isLoading;

  List<Banner> get banners => _banners;

  bool get disposed => _disposed;

  BannerViewModel({required BannerApi apiService}) : _apiService = apiService {
    fetchBanners();
  }

  Future<void> fetchBanners({int? page, int? limit}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _banners = await _apiService.fetchBanners(page: page, limit: limit);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching banners: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    if (!disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
