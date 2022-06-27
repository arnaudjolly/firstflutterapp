import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get filename => kReleaseMode ? ".env.production" : ".env.development";
  static String get githubClientId => dotenv.get('OAUTH_GITHUB_CLIENT_ID', fallback: 'please enter github client id in env file');
  static String get githubClientSecret => dotenv.get('OAUTH_GITHUB_CLIENT_SECRET', fallback: 'please enter github client secret in env file');
}