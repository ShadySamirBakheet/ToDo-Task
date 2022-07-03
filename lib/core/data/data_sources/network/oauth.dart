// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:oauth_dio/oauth_dio.dart';

// class OAuthSecureStorage extends OAuthStorage {
//   final FlutterSecureStorage storage = const FlutterSecureStorage(
//     aOptions: AndroidOptions(encryptedSharedPreferences: true),
//     iOptions: IOSOptions(accessibility: IOSAccessibility.first_unlock),
//   );
//   final accessTokenKey = 'accessToken';
//   final refreshTokenKey = 'refreshToken';

//   @override
//   Future<OAuthToken> fetch() async {
//     return OAuthToken(
//       accessToken: await storage.read(key: accessTokenKey),
//       refreshToken: await storage.read(key: refreshTokenKey),
//     );
//   }

//   @override
//   Future<OAuthToken> save(OAuthToken token) async {
//     await storage.write(key: accessTokenKey, value: token.accessToken);
//     await storage.write(key: refreshTokenKey, value: token.refreshToken);
//     return token;
//   }

//   @override
//   Future<void> clear() async {
//     await storage.delete(key: accessTokenKey);
//     await storage.delete(key: refreshTokenKey);
//   }
// }
