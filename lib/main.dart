import 'package:f_mvvm_1/services/api/banner_api.dart';
import 'package:f_mvvm_1/viewmodels/banner_viewmodel.dart';
import 'package:f_mvvm_1/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BannerViewModel(apiService: BannerApi()),
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
