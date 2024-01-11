import 'package:dotenv/dotenv.dart';

class Globals {}

class Tokens {
  static String supabaseUrl = '';
  static String supabaseApiKey = '';

  static void loadTokens() {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    supabaseUrl = env['supaBaseUrl'] ?? '';
    supabaseApiKey = env['supaBaseAPIKey'] ?? '';
  }
}
