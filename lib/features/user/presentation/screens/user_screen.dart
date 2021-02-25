import 'package:clean_architecture/app/route/app_route.dart';
import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/user_view_model.dart';
import 'package:clean_architecture/features/user/presentation/widgets/user_info_section.dart';
import 'package:clean_architecture/features/user/presentation/widgets/user_search_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  final UserViewModel _viewModel;

  UserScreen(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clean Architecture",
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListenableProvider(
      create: (_) => _viewModel,
      child: Stack(
        children: [
          Column(
            children: [
              UserSearchSection(),
              UserInfoSection(),
            ],
          ),
          Obx(() {
            return _viewModel.user.value?.state == Status.SUCCESS ? repositoryButton(context) : Container();
          })
        ],
      ),
    );
  }

  Widget repositoryButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 250,
        padding: EdgeInsets.only(bottom: 16),
        child: OutlineButton(
          onPressed: () => navigateToRepos(context, _viewModel.typedUser.value),
          child: Text(
            "Ver repositórios",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          borderSide: BorderSide(width: 2, color: Colors.blue),
          splashColor: Colors.lightBlue[100],
        ),
      ),
    );
  }

  void navigateToRepos(context, String value) {
    Navigator.of(context).pushNamed(AppRoute.ROUTE_REPO, arguments: value);
  }
}
