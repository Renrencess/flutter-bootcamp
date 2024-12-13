import 'package:http/http.dart' show Client;
import 'package:myapp/model/user_model.dart';
  import 'dart:convert';

import 'package:myapp/util/auth.dart';
import 'package:myapp/util/config.dart';

  class UserApi {
    Client client = Client();

    Future<User?> getUser() async {
      final headers = await Auth.getHeaders();
      final userId = await Auth.getUserid();
      final response = await client.get(Uri.parse("${Config().baseUrl}/user/${userId}"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return User.fromJson(data['data']);
      } else {
        return null;
      }
    }
  }
