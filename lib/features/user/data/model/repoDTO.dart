class RepoDTO {
  int id;
  String name;
  String description;
  String language;


  RepoDTO.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    description = map["description"];
    language = map["language"];
  }
}