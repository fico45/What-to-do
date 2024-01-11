import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:what_to_do/model/auth_model.dart';
import 'package:what_to_do/repository/auth/auth_repository.dart';
import 'package:what_to_do/utils/api/supabase.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthModel build() => const AuthModel.signedOut();

  Future<User?> signIn(
      {required String email, required String password}) async {
    final response = await ref
        .read(authRepositoryProvider)
        .signInWithPassword(email: email, password: password);
    state = response != null
        ? AuthModel.signedIn(
            id: response.id,
            displayName: response.aud,
            email: response.email ?? 'empty',
            token: '',
          )
        : const AuthModel.signedOut();
  }

  Future signUp({required String email, required String password}) async {
    final response = ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password);

    return response;
  }

  void signOut() async {
    await SupabaseWrapper.client.auth.signOut();
    state = const AuthModel.signedOut();
  }

  Future<User?> getUser() async {
    return SupabaseWrapper.client.auth.currentUser;
  }

  Future<User?> updateUser({required UserAttributes newUser}) async {
    final updatedUser = await SupabaseWrapper.client.auth.updateUser(newUser);

    return updatedUser.user;
  }
}
