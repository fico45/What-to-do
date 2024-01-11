import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_do/provider/auth/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static String get routeName => 'home';
  static String get routeLocation => '/';
  static String get title => 'home.title'.tr();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPr = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(HomePage.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Wellcome, User. This is your homepage."),
            ElevatedButton(
              onPressed: () async {
                authPr.signOut();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
