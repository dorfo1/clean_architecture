class UserDTO {
  int id;
  String avatar;
  String name;
  int followers;
  int following;
  int repos;
  int gists;

  UserDTO.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    avatar = map["avatar_url"];
    name = map["name"];
    followers = map["followers"];
    following = map["following"];
    repos = map["public_repos"];
    repos = map["public_gists"];
  }
}
