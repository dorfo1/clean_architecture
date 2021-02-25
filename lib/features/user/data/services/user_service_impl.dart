import 'package:clean_architecture/common/adapter/http_adapter.dart';
import 'package:clean_architecture/features/user/data/model/repoDTO.dart';
import 'package:clean_architecture/features/user/data/model/userDTO.dart';
import 'package:clean_architecture/features/user/domain/services/user_service.dart';

class UserServiceImpl extends UserService {

  final HttpAdapter _adapter;
  
  UserServiceImpl(this._adapter);

  @override
  Future<List<RepoDTO>> getRepositories(String userName) async {
    return _adapter.get("users/$userName/repos").then((value) => convertToRepoList(value.data));
  }

  @override
  Future<UserDTO> getUser(String name) async {
    return _adapter.get("users/$name").then((value) => UserDTO.fromJson(value.data));
  }

  List<RepoDTO> convertToRepoList(json) {
    return (json as List).map((e) => RepoDTO.fromJson(e)).toList();
  }
}
