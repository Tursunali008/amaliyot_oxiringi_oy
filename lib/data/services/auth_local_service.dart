import 'package:hive/hive.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/auth_response.dart';

class AuthLocalService {
  final _authBox = Hive.box('authBox');
  final _authKey = 'tokenData';

  Future<void> saveToken(AuthResponse auth) async {
    await _authBox.put(_authKey, auth.token); // Save token in Hive
  }

  String? getToken() {
    return _authBox.get(_authKey); // Retrieve token from Hive
  }

  Future<void> deleteToken() async {
    await _authBox.delete(_authKey); // Delete token from Hive
  }
}
