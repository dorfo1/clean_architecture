import 'package:clean_architecture/common/base/resource.dart';
import 'package:clean_architecture/features/user/domain/entity/repo.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/repos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReposScreen extends StatefulWidget {
  final ReposViewModel _viewModel;
  final String username;

  ReposScreen(this._viewModel, this.username);

  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  @override
  void initState() {
    widget._viewModel.fetchRepos(widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositórios de ${widget.username}"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Obx(() {
      switch (widget._viewModel.repos.value?.state) {
        case Status.SUCCESS:
          return showRepositories(widget._viewModel.repos.value.data);
        case Status.LOADING:
          return showLoading();
        case Status.ERROR:
          return showError();
        default:
          return Container();
      }
    });
  }

  showError() {
    return Center(
      child: Text("Falha ao buscar reposítorios"),
    );
  }

  showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  showRepositories(List<Repo> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context,index) {
        var repo = data[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(repo.name ?? "Nome indisponível"),
                  SizedBox(height: 4,),
                  Text(repo.description ?? "Descrição indisponível"),
                  SizedBox(height: 4,),
                  Text(repo.language ?? "Linguagem indisponível"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
