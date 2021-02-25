import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/repo.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user_repositories.dart';
import 'package:get/get.dart';

class ReposViewModel extends GetxController{

  final GetUserRepositories _getUserRepositories;

  ReposViewModel(this._getUserRepositories);

  var repos = Rx<Resource<List<Repo>>>();

  void fetchRepos(String userName) async {
    repos.value = Resource.loading();
    repos.value = await _getUserRepositories(userName);
  }
}