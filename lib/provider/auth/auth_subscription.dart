import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:what_to_do/provider/auth/auth_provider.dart';
import 'package:what_to_do/utils/api/supabase.dart';

part 'auth_subscription.g.dart';

@Riverpod(keepAlive: true)
class AuthSubscription extends _$AuthSubscription {
  @override
  StreamSubscription<AuthState> build() =>
      SupabaseWrapper.client.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        //final Session? session = data.session;

        if (event == AuthChangeEvent.signedIn) {
        } else if (event == AuthChangeEvent.signedOut) {
          ref.read(authProvider.notifier).signOut();
        }
      });
}
