import 'package:app/data/dummy_users.dart';
import 'package:app/widgets/user_title.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemBuilder: (context, i) => UserTitle(users.values.elementAt(i)),
          itemCount: users.length),
    );
  }
}
