import 'dart:math';

import 'package:f_mvvm_1/viewmodels/banner_viewmodel.dart';
import 'package:f_mvvm_1/views/home/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter MVVM'),
      ),
      body: Stack(children: [
        const ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Colors.black54,
              child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(), child: HomeBanner())),
        ),
        Consumer<BannerViewModel>(
          builder: (ctx, banner, __) {
            if (banner.isLoading) {
              return Container(
                color: Colors.black45,
                width: MediaQuery.of(ctx).size.width,
                height: MediaQuery.of(ctx).size.height -
                    (Scaffold.of(ctx).appBarMaxHeight ?? 0),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const LinearProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ]),
      floatingActionButton: Consumer<BannerViewModel>(
        builder: (ctx, banner, __) => IgnorePointer(
          ignoring: banner.isLoading,
          child: FloatingActionButton(
            onPressed: () {
              banner.fetchBanners(
                  page: 1 + Random().nextInt(10),
                  limit: 3 + Random().nextInt(10));
            },
            tooltip: 'Reload',
            child: const Icon(Icons.refresh),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
