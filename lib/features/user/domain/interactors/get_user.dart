import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/common/base/use_case.dart';
import 'package:clean_architecture/features/user/domain/entity/user.dart';

abstract class GetUser extends UseCase<String,Resource<User>>{}

class InvalidUserException implements Exception{}