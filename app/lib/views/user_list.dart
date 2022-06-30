import 'package:app/provider/users.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/widgets/user_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                // users.put(const UserModel(
                //     nome: 'Teste', email: 'teste@teste.com', avatar: ''));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, i) => UserTitle(users.byIndex(i)),
          itemCount: users.count),
    );
  }
}
