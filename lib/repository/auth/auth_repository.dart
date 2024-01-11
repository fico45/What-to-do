import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:what_to_do/utils/api/supabase.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    final response = await SupabaseWrapper.client.auth
        .signUp(email: email, password: password);
    return response.user;
  }

  Future<User?> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final response = await SupabaseWrapper.client.auth
        .signInWithPassword(email: email, password: password);
    return response.user;
  }
}
