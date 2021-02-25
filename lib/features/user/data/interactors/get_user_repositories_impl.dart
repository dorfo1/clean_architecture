import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/repo.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user_repositories.dart';
import 'package:clean_architecture/features/user/domain/services/user_service.dart';
import 'package:dio/dio.dart';

class GetUserRepositoriesImpl extends GetUserRepositories {
  UserService _service;

  GetUserRepositoriesImpl(this._service);

  @override
  Future<Resource<List<Repo>>> call(String params) async {
    try {
      var response = await _service.getRepositories(params);
      var repos = response.map((e) => Repo.fromDTO(e)).toList();
      return Resource.success(repos);
    } on DioError catch (ex) {
      return Resource.error(ex);
    } on Error catch(ex){
      return Resource.error(Exception(ex.stackTrace));
    } catch(ex){
      return Resource.error(ex);
    }
  }
}
