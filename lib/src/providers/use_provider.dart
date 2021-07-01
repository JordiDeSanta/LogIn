import 'package:http/http.dart' as http;

class UserProvider {
  Future newUser(String email, String password) {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http
    };
  }
}
