import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';
  static String get title => 'splash.title'.tr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SplashPage.title,
        ),
      ),
      body: const Center(
        child: Text(
          "Splash Page",
        ),
      ),
    );
  }
}
