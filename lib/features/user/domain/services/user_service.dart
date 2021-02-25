import 'package:clean_architecture/features/user/data/model/repoDTO.dart';
import 'package:clean_architecture/features/user/data/model/userDTO.dart';

abstract class UserService{

  Future<UserDTO> getUser(String name);

  Future<List<RepoDTO>> getRepositories(String userName);
}