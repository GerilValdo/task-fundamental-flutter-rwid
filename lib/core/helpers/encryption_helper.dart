import 'package:encrypt/encrypt.dart';

class EncryptionHelpers {
  static final key = Key.fromUtf8('my 32 length key................');
  static final iv = IV.fromLength(16);
  static final encrypter = Encrypter(AES(key, mode: AESMode.ecb));

  static String encrypt(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static decrypt(String encryptedText) {
    return encrypter.decrypt64(encryptedText, iv: iv);
  }
}
