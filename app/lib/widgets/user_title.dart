import 'package:app/models/user.dart';
import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {
  final UserModel user;
  const UserTitle(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatar == null || user.avatar!.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatar!),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.nome!),
      subtitle: Text(user.email!),
      trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.lightBlue,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
