import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:searchengine/util/secrets.dart';

class SecretLoader {
  final String _secretPath;

  SecretLoader(this._secretPath);

  Future<Secret> loadSecrets() {
    return rootBundle.loadStructuredData<Secret>(_secretPath, (jsonStr) async {
      return Secret.fromJson(json.decode(jsonStr));
    });
  }
}
