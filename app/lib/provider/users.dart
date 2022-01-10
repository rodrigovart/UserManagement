import 'package:app/data/dummy_users.dart';
import 'package:app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier {
  final Map<int, UserModel>_itens = {...DUMMY_USERS};

  List<UserModel> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }
}
