import 'package:clean_architecture/features/user/presentation/viewmodels/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSearchSection extends StatelessWidget {

  UserViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<UserViewModel>(context);

    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Buscar usuário",
          icon: Icon(Icons.search),
        ),
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.search,
        onChanged: (value) => _viewModel.setTypedUser(value),
        onSubmitted: (value) => _viewModel.fetchUser(value),
      ),
    );
  }
}
