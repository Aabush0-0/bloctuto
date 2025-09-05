import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class AppKeys {
  static Map<String, dynamic>? _keys;

  /// Load keys.json
  static Future<void> load() async {
    final jsonString = await rootBundle.loadString('assets/keys.json');
    _keys = json.decode(jsonString);
  }

  /// Get TREFLE_TOKEN
  static String get trefleToken => _keys?['TREFLE_TOKEN'] ?? '';
}
