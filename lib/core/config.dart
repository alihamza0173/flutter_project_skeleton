import 'package:flutter_dotenv/flutter_dotenv.dart';

class _Config {
  String get appName => dotenv.env['APP_NAME']!;

  String get apiUrl => 'https://${dotenv.env['API_URL']!}/api/v1/';

  String? get eventCode => dotenv.env['EVENT_CODE'];
}

final config = _Config();
