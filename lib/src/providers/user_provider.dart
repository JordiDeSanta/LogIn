import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyB5xGb7WDY8sMWj0vUozsdZK-CjWOn7aEc';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final String _firebaseToken = 'AIzaSyB5xGb7WDY8sMWj0vUozsdZK-CjWOn7aEc';
    final Uri _url = Uri.https('identitytoolkit.googleapis.com',
        '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      _url,
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final Uri _url = Uri.https('identitytoolkit.googleapis.com',
        '/v1/accounts:signUp', {'key': _firebaseToken});

    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      _url,
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}
