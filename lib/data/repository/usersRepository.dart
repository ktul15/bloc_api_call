import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:bloc_api_call_demo/data/req_res_api/req_res_api_client.dart';
import 'package:bloc_api_call_demo/utils/api_urls.dart';

class UsersRepository {
  final ReqResApiClient _apiClient = ReqResApiClient();

  Future<UsersList> fetchUsersByPage(String pageNum) async {
    final res = await _apiClient.get("${ApiUrls.usersEndpoint}$pageNum");
    return UsersList.fromJson(res);
  }
}
