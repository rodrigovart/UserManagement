import 'package:app/models/user.dart';
import 'package:app/provider/users.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTitle extends StatelessWidget {
  final UserModel user;
  const UserTitle(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersProvider usersProvider = Provider.of(context);
    final avatar = user.avatar == null || user.avatar.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Deseja Excluir o Usuário?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              fixedSize: const Size(50, 10),
                              padding: const EdgeInsets.all(10)),
                          onPressed: () {
                            usersProvider.remove(user);
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('OK'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              fixedSize: const Size(100, 10),
                              padding: const EdgeInsets.all(10)),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ),
                  ).then((value) {
                    if (value) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluido!'),
                          actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              fixedSize: const Size(50, 10),
                              padding: const EdgeInsets.all(10)),
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('OK'),
                        ),
                          ],
                        ),
                      );
                    }
                  });
                },
              ),
            ],
          )),
    );
  }
}
