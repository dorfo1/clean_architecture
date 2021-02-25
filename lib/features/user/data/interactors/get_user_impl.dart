import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/user.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user.dart';
import 'package:clean_architecture/features/user/domain/services/user_service.dart';
import 'package:dio/dio.dart';

class GetUserImpl extends GetUser {
  UserService _service;

  GetUserImpl(this._service);

  @override
  Future<Resource<User>> call(String params) async {
    try {
      var response = await _service.getUser(params);
      var user = User.fromDTO(response);
      return Resource.success(user);
    } on DioError catch (ex) {
      if (ex.response.statusCode == 404)
        return Resource.error(InvalidUserException());
      else
        return Resource.error(ex);
    } on Error catch(ex) {
      return Resource.error(Exception(ex.stackTrace));
    }
  }
}
