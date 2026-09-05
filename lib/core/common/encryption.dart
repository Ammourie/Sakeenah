import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Encryption {
  Encryption._();

  static late Encrypter _encrypter;
  static final _storage = const FlutterSecureStorage();

  static Future<void> init() async {
    var keyString = await _storage.read(key: 'encryption_key');
    if (keyString == null) {
      // Generate a random key and store it
      final newKey = Key.fromSecureRandom(32);
      await _storage.write(key: 'encryption_key', value: newKey.base64);
      keyString = newKey.base64;
    }
    final key = Key.fromBase64(keyString);
    _encrypter = Encrypter(AES(key));
  }

  static String encrypt(String text) {
    final iv = IV.fromSecureRandom(16); // unique IV each time
    final encrypted = _encrypter.encrypt(text, iv: iv);
    return '${iv.base64}:${encrypted.base64}';
  }

  static String decrypt(String text) {
    final parts = text.split(':');
    if (parts.length != 2) throw Exception('Invalid encrypted data format');

    final iv = IV.fromBase64(parts[0]);
    final encrypted = Encrypted.fromBase64(parts[1]);
    return _encrypter.decrypt(encrypted, iv: iv);
  }
}
