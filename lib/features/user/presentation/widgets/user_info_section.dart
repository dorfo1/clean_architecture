import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/user.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserInfoSection extends StatefulWidget {
  @override
  _UserInfoSectionState createState() => _UserInfoSectionState();
}

class _UserInfoSectionState extends State<UserInfoSection> {
  UserViewModel _viewModel;

  @override
  void didChangeDependencies() {
    _viewModel = Provider.of<UserViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (_viewModel.user.value?.state) {
        case Status.SUCCESS:
          return showUserInfo(_viewModel.user.value.data);
        case Status.LOADING:
          return showLoading();
        case Status.ERROR:
          return showError(_viewModel.user.value.exception);
        default:
          return Container();
      }
    });
  }

  Widget showUserInfo(User data) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Image.network(
          data.avatar,
          height: 250,
          width: 150,
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name ?? "Nome não informado",
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Seguires ${data?.followers}",
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Seguindo ${data?.following}",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget showError(Exception exception) {
    var message;

    if (exception is InvalidUserException)
      message = "Usuário inválido";
    else
      message = "Falha ao buscar usuário";

    return Container(
      child: Center(
        child: Text(message),
      ),
    );
  }

  Widget showLoading() {
    return Expanded(
      child: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
