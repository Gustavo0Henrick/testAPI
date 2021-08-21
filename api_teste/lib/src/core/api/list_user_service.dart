import 'package:api_teste/src/core/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListUser {
  Future<List<Map>> getUsers() async {
    const url = 'https://www.testjsonapi.com/users/';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<Map> users = [];
    for (var singleUser in responseData) {
      UserModel user = UserModel(
        id: singleUser["id"],
        name: singleUser["name"],
        email: singleUser["email"],
        job_title: singleUser["job_title"],
        created_at: singleUser["created_at"],
        updated_at: singleUser["updated_at"],
      );

      users.add(user.toMap());
    }
    return users;
  }
}
