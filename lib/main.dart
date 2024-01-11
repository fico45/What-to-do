import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_do/router/router.dart';
import 'package:what_to_do/theme/theme_data.dart';
import 'package:what_to_do/utils/api/supabase.dart';
import 'package:what_to_do/utils/state_logger.dart';
import 'package:what_to_do/utils/tokens.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const locale = Locale('hr', 'HR');
  await EasyLocalization.ensureInitialized();
  Tokens.loadTokens();
  SupabaseWrapper.init();
  runApp(
    ProviderScope(
      observers: const [
        StateLogger(),
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [locale],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'What To-Do',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          final router = ref.watch(routerProvider);

          return MaterialApp.router(
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            title: 'What To-Do',
            theme: CustomTheme.light,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
