import 'package:clean_architecture/features/user/data/model/repoDTO.dart';

class Repo {
  int id;
  String name;
  String description;
  String language;

  Repo.fromDTO(RepoDTO repo) {
    id = repo.id;
    name = repo.name;
    description = repo.description;
    language = repo.language;
  }
}
