import 'dart:math';

import 'package:app/data/dummy_users.dart';
import 'package:app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier {
  final Map<int, UserModel> _itens = {...DUMMY_USERS};

  List<UserModel> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  UserModel byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(UserModel user) {
    if (user != null) {
      if ((user.id != null) && (_itens.containsKey(user.id))) {
        _itens.update(user.id!, (_) => user);
      } else {
        final id = Random().nextInt(500);

        _itens.putIfAbsent(
          id,
          () => UserModel(
              id: id, nome: user.nome, email: user.email, avatar: user.avatar),
        );
      }
    }
    notifyListeners();
  }

  void remove(UserModel user) {
    if (user.id != null) {
      _itens.remove(user.id!);
    }
    notifyListeners();
  }
}
