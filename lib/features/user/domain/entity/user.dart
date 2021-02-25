
import 'package:clean_architecture/features/user/data/model/userDTO.dart';

class User{
  int id;
  String avatar;
  String name;
  int followers;
  int following;
  int repos;
  int gists;


  User.fromDTO(UserDTO user){
    id = user.id;
    avatar = user.avatar;
    name = user.name;
    followers = user.followers;
    following = user.following;
    repos = user.repos;
    gists = user.gists;
  }

}