import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:bloc_api_call_demo/data/req_res_api/req_res_api_client.dart';
import 'package:bloc_api_call_demo/utils/api_urls.dart';

class UsersRepository {
  final ReqResApiClient _apiClient = ReqResApiClient();

  Future<UsersList> fetchUsersByPage(int pageNum) async {
    final res = await _apiClient.get("${ApiUrls.usersListEndpoint}$pageNum");
    return UsersList.fromJson(res);
  }

  Future<User> fetchUserById(int userId) async {
    final res = await _apiClient.get("${ApiUrls.userEndpoint}/$userId");
    return User.fromJson(res["data"]);
  }
}
