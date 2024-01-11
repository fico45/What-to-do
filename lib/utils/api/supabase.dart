import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:what_to_do/utils/tokens.dart';

class SupabaseWrapper {
  static final SupabaseWrapper _instance = SupabaseWrapper._internal();
  static late SupabaseClient _client;

  factory SupabaseWrapper() {
    return _instance;
  }

  SupabaseWrapper._internal();

  static void init() {
    Supabase.initialize(
        url: Tokens.supabaseUrl, anonKey: Tokens.supabaseApiKey);
    _client = Supabase.instance.client;
  }

  static SupabaseClient get client => _client;
}
