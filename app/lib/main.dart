// ignore_for_file: unused_import

import 'package:app/models/user.dart';
import 'package:app/provider/users.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/views/user-form.dart';
import 'package:app/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersProvider()),
      ],
      child: MaterialApp(
        title: 'Users Management',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routes: {
          AppRoutes.HOME: (_) => const UserList(),
          AppRoutes.USER_FORM: (_) => const UserForm()
        },
      ),
    );
  }
}
