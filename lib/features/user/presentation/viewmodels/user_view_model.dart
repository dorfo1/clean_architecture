import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/user.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user.dart';
import 'package:get/get.dart';

class UserViewModel extends GetxController {
  final GetUser _getUser;

  UserViewModel(this._getUser);

  var user = Rx<Resource<User>>();
  var typedUser = Rx<String>();

  void fetchUser(String userName) async {
    user.value = Resource.loading();
    user.value = await _getUser(userName);
  }

  void setTypedUser(String value) => typedUser.value = value;

}
