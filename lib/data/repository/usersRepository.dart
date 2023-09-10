import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:bloc_api_call_demo/data/req_res_api/req_res_api_client.dart';
import 'package:bloc_api_call_demo/utils/api_exceptions.dart';
import 'package:bloc_api_call_demo/utils/api_urls.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersRepository {
  final ReqResApiClient _apiClient = ReqResApiClient();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference get _users => _firebaseFirestore.collection("users");

  Future<UsersList> fetchUsersByPage(int pageNum) async {
    final res = await _apiClient.get("${ApiUrls.usersListEndpoint}$pageNum");
    debugPrint("res: $res");
    return UsersList.fromJson(res);
  }

  Future<User> fetchUserById(int userId) async {
    final res = await _apiClient.get("${ApiUrls.userEndpoint}/$userId");

    debugPrint("res: $res");
    if (!res.containsKey('data')) {
      throw UserNotFoundFailure();
    }

    return User.fromJson(res["data"]);
  }

  Future<void> addDataToFireStore(User user) async {
    await _users.doc(user.id.toString()).set(user.toJson());
  }

  Future<void> deleteDataFromFirestore(int userId) async {
    await _users.doc(userId.toString()).delete();
  }
}
